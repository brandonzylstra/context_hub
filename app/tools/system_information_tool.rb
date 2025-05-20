# frozen_string_literal: true

class SystemInformationTool < ApplicationTool
  description "Get detailed information about the system running Context Hub"

  arguments do
    optional(:include_env).filled(:bool).description("Whether to include environment variables (non-sensitive only)")
    optional(:include_network).filled(:bool).description("Whether to include network interfaces")
    optional(:include_ruby_gems).filled(:bool).description("Whether to include Ruby gems information")
  end

  def call(include_env: false, include_network: false, include_ruby_gems: false)
    system_info = {
      timestamp: Time.now.iso8601,
      operating_system: operating_system_info,
      shell: shell_info,
      ruby: ruby_info,
      rails: rails_info,
      hardware: hardware_info
    }

    # Optional sections
    system_info[:environment_variables] = filtered_env_vars if include_env
    system_info[:network] = network_info if include_network
    system_info[:ruby_gems] = gem_info if include_ruby_gems

    system_info
  end

  private

  def operating_system_info
    os_info = {}
    
    if RUBY_PLATFORM =~ /darwin/
      os_info[:type] = "macOS"
      os_info[:version] = `sw_vers -productVersion`.strip
      os_info[:build] = `sw_vers -buildVersion`.strip
      os_info[:architecture] = `uname -m`.strip
    elsif RUBY_PLATFORM =~ /linux/
      os_info[:type] = "Linux"
      os_info[:distribution] = `lsb_release -d 2>/dev/null`.strip.gsub("Description:", "").strip rescue "Unknown"
      os_info[:kernel] = `uname -r`.strip
      os_info[:architecture] = `uname -m`.strip
    elsif RUBY_PLATFORM =~ /mswin|mingw|windows/
      os_info[:type] = "Windows"
      os_info[:version] = ENV["OS"]
      os_info[:architecture] = ENV["PROCESSOR_ARCHITECTURE"]
    else
      os_info[:type] = RUBY_PLATFORM
    end
    
    os_info
  end

  def shell_info
    {
      type: ENV["SHELL"]&.split("/")&.last || "unknown",
      path: ENV["SHELL"] || "unknown",
      terminal: ENV["TERM_PROGRAM"] || ENV["TERMINAL_EMULATOR"] || "unknown"
    }
  end

  def ruby_info
    {
      version: RUBY_VERSION,
      platform: RUBY_PLATFORM,
      engine: defined?(RUBY_ENGINE) ? RUBY_ENGINE : "ruby",
      engine_version: defined?(RUBY_ENGINE_VERSION) ? RUBY_ENGINE_VERSION : RUBY_VERSION,
      patchlevel: RUBY_PATCHLEVEL.to_s,
      jit_enabled: (defined?(RubyVM::MJIT) && RubyVM::MJIT.enabled? rescue false)
    }
  end

  def rails_info
    {
      version: Rails.version,
      environment: Rails.env,
      root_path: Rails.root.to_s,
      database_adapter: ActiveRecord::Base.connection.adapter_name
    }
  end

  def hardware_info
    info = {}
    
    if RUBY_PLATFORM =~ /darwin/
      # macOS
      info[:cpu] = {
        model: `sysctl -n machdep.cpu.brand_string`.strip,
        cores: `sysctl -n hw.physicalcpu`.strip.to_i,
        logical_cores: `sysctl -n hw.logicalcpu`.strip.to_i
      }
      info[:memory] = {
        total: `sysctl -n hw.memsize`.strip.to_i / (1024**2),
        available: nil # Not easily available on macOS without additional tools
      }
    elsif RUBY_PLATFORM =~ /linux/
      # Linux
      begin
        cpu_info = File.read('/proc/cpuinfo')
        model = cpu_info.scan(/model name\s+:\s+(.+)/).first&.first || "Unknown"
        cores = cpu_info.scan(/cpu cores\s+:\s+(\d+)/).first&.first&.to_i || 1
        info[:cpu] = {
          model: model,
          cores: cores,
          logical_cores: `nproc`.strip.to_i
        }
      rescue
        info[:cpu] = { model: "Unknown", cores: 1, logical_cores: 1 }
      end
      
      begin
        mem_info = File.read('/proc/meminfo')
        total = mem_info.match(/MemTotal:\s+(\d+)/)[1].to_i / 1024 rescue nil
        available = mem_info.match(/MemAvailable:\s+(\d+)/)[1].to_i / 1024 rescue nil
        info[:memory] = {
          total: total,
          available: available
        }
      rescue
        info[:memory] = { total: nil, available: nil }
      end
    else
      # Windows or other platforms
      info[:cpu] = { model: "Unknown", cores: nil, logical_cores: nil }
      info[:memory] = { total: nil, available: nil }
    end
    
    info
  end

  def filtered_env_vars
    # Only include safe, non-sensitive environment variables
    safe_vars = %w[
      LANG LC_ALL TERM PATH PWD HOME USER LOGNAME SHELL
      TERM_PROGRAM COLORTERM EDITOR VISUAL PAGER
      TZ HOSTNAME RACK_ENV RAILS_ENV
    ]
    
    safe_vars.each_with_object({}) do |var, result|
      result[var] = ENV[var] if ENV[var]
    end
  end

  def network_info
    interfaces = []
    
    if RUBY_PLATFORM =~ /darwin/ || RUBY_PLATFORM =~ /linux/
      # Use ifconfig on macOS and Linux
      ifconfig_output = `ifconfig 2>/dev/null || ip addr show 2>/dev/null`
      interface_blocks = ifconfig_output.split(/^\S+:/)
      
      interface_blocks.each do |block|
        next if block.strip.empty?
        
        interface_name = block.lines.first&.strip&.split(/\s/)&.first
        next unless interface_name
        
        ipv4 = block.match(/inet (\d+\.\d+\.\d+\.\d+)/)&.captures&.first
        ipv6 = block.match(/inet6 ([0-9a-f:]+)/i)&.captures&.first
        mac = block.match(/ether ([0-9a-f:]+)/i)&.captures&.first || 
              block.match(/lladdr ([0-9a-f:]+)/i)&.captures&.first ||
              block.match(/hwaddr ([0-9a-f:]+)/i)&.captures&.first
        
        interfaces << {
          name: interface_name,
          ipv4: ipv4,
          ipv6: ipv6,
          mac: mac
        }.compact
      end
    end
    
    { interfaces: interfaces }
  end

  def gem_info
    # Get information about key gems in the application
    gems = {}
    
    %w[rails activesupport actionpack activerecord fast-mcp].each do |gem_name|
      if Gem.loaded_specs[gem_name]
        spec = Gem.loaded_specs[gem_name]
        gems[gem_name] = {
          version: spec.version.to_s,
          path: spec.full_gem_path
        }
      end
    end
    
    {
      ruby_version_manager: detect_ruby_version_manager,
      bundler_version: Bundler::VERSION,
      key_gems: gems
    }
  end
  
  def detect_ruby_version_manager
    if ENV['RBENV_ROOT']
      'rbenv'
    elsif ENV['RVM_ROOT'] || ENV['rvm_path']
      'rvm'
    elsif ENV['ASDF_DIR']
      'asdf'
    else
      'unknown'
    end
  end
end