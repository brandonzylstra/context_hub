# frozen_string_literal: true

class RulesResource < ApplicationResource
  uri 'rules'
  resource_name 'LLM Rules'
  description 'Rules and instructions for LLM behavior'
  mime_type 'text/markdown'

  def content
    create_default_rules_file(rules_path) unless File.exist?(rules_path)
    return "Path exists but is not a file: #{rules_path}" unless File.file?(rules_path)
    File.read(rules_path)
  rescue => e
    "Error reading rules file: #{e.message}"
  end

  private def rules_path
    Rails.application.config.rules_file_path
  end

  private def create_default_rules_file(file_path)
    # Ensure the directory exists
    FileUtils.mkdir_p(File.dirname(file_path))

    # Create default rules content
    default_content = <<~MARKDOWN
      # LLM Rules and Instructions

      This file contains rules and instructions for LLM behavior.

      ## General Guidelines

      - Be helpful and accurate
      - Follow user instructions carefully
      - Ask for clarification when needed

      ## Specific Rules

      Add your custom rules here...
    MARKDOWN

    File.write(file_path, default_content)
  end
end
