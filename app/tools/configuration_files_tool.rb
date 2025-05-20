# frozen_string_literal: true

class ConfigurationFilesTool < ApplicationTool
  description "Access configuration files from your system to share with MCP clients"

  arguments do
    required(:path).filled(:string).description("Path to the configuration file")
    optional(:expand_home).filled(:bool).description("Whether to expand ~ to the home directory")
    optional(:parse).filled(:bool).description("Whether to parse the file based on extension (json, yaml, etc.)")
  end

  def call(path:, expand_home: true, parse: false)
    # Expand home directory if requested
    actual_path = expand_home ? File.expand_path(path) : path
    
    # Security check - don't allow accessing sensitive files
    if sensitive_file?(actual_path)
      return { error: "Access to this file is not allowed for security reasons" }
    end
    
    # Check if file exists
    unless File.exist?(actual_path)
      return { error: "File not found" }
    end
    
    # Check if file is readable
    unless File.readable?(actual_path)
      return { error: "File is not readable" }
    end
    
    begin
      content = File.read(actual_path)
      
      # Return appropriate response
      if parse
        parsed_content = parse_file_content(actual_path, content)
        {
          path: actual_path,
          exists: true,
          content: content,
          parsed_content: parsed_content,
          file_type: file_type(actual_path)
        }
      else
        {
          path: actual_path,
          exists: true,
          content: content,
          file_type: file_type(actual_path)
        }
      end
    rescue => e
      { error: "Failed to read file: #{e.message}" }
    end
  end
  
  private
  
  def sensitive_file?(path)
    # List of sensitive file patterns to block
    sensitive_patterns = [
      # Core credential files
      /\.env\b/,
      /\.aws\/credentials/,
      /\.ssh\/id_.*$/,
      /\.ssh\/.*_key$/,
      /\.ssh\/authorized_keys/,
      /\.ssh\/config/,
      /\.netrc/,
      /\.pgpass/,
      
      # System files
      /\/etc\/passwd/,
      /\/etc\/shadow/,
      /\/etc\/sudoers/,
      
      # Various application credential files
      /\.credentials\.json/,
      /client_secret.*\.json/,
      /\.kube\/config/,
      /\.docker\/config\.json/,
      /config\/master\.key/,
      /config\/credentials\.yml\.enc/,
      /\.npmrc/,
      /\.pypirc/
    ]
    
    # Check if any sensitive pattern matches
    sensitive_patterns.any? { |pattern| path.match?(pattern) }
  end
  
  def file_type(path)
    ext = File.extname(path).downcase.delete('.')
    return 'text' if ext.empty?
    ext
  end
  
  def parse_file_content(path, content)
    ext = File.extname(path).downcase
    
    case ext
    when '.json'
      JSON.parse(content) rescue content
    when '.yml', '.yaml'
      YAML.safe_load(content) rescue content
    when '.xml'
      Nokogiri::XML(content).to_hash rescue content
    when '.toml'
      # Would require a TOML parser gem
      content
    when '.ini', '.conf', '.cfg'
      parse_ini_content(content)
    else
      content
    end
  end
  
  def parse_ini_content(content)
    result = {}
    current_section = nil
    
    content.each_line do |line|
      line = line.strip
      next if line.empty? || line.start_with?('#', ';')
      
      if line.start_with?('[') && line.end_with?(']')
        current_section = line[1..-2]
        result[current_section] = {} unless result[current_section]
      elsif line.include?('=')
        key, value = line.split('=', 2).map(&:strip)
        
        if current_section
          result[current_section][key] = value
        else
          result[key] = value
        end
      end
    end
    
    result
  end
end