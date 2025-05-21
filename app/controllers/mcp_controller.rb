class McpController < ApplicationController
  def dashboard
    @tools = ApplicationTool.descendants.reject { |tool| tool == ApplicationTool }
    @resources = ApplicationResource.descendants.reject { |resource| resource == ApplicationResource }
    
    # Group tools by category based on class name
    @tools_by_category = @tools.group_by do |tool|
      if tool.name.include?('User') || tool.name.include?('Preference')
        'Preferences'
      elsif tool.name.include?('System')
        'System'
      elsif tool.name.include?('Configuration') || tool.name.include?('Config')
        'Configuration'
      elsif tool.name.include?('Sample')
        'Sample/Demo'
      else
        'Other'
      end
    end
    
    # Group resources by category based on class name
    @resources_by_category = @resources.group_by do |resource|
      if resource.name.include?('User') || resource.name.include?('Preference')
        'Preferences'
      elsif resource.name.include?('Sample')
        'Sample/Demo'
      else
        'Other'
      end
    end
  end
  
  def docs
    # Documentation content here
    @mcp_readme_path = Rails.root.join('MCP_USAGE.md')
    if File.exist?(@mcp_readme_path)
      @mcp_readme_content = File.read(@mcp_readme_path)
    else
      @mcp_readme_content = "MCP usage documentation not found."
    end
    
    # Load the swagger JSON for display
    begin
      @swagger_content = FastMcp.swagger_json
    rescue => e
      @swagger_content = { error: e.message }.to_json
    end
  end
end