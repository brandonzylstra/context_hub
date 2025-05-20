# frozen_string_literal: true

class UserPreferencesResource < ApplicationResource
  uri "user_preferences"
  resource_name "User Preferences"
  description "User's coding and environment preferences for MCP clients"
  mime_type "application/json"

  def content
    # Get all active preference categories
    categories = PreferenceCategory.active.ordered

    # Build a structured response with all categories and their values
    preferences_data = categories.map do |category|
      # Get all stored preferences for this category
      stored_preferences = UserPreference.by_name(category.name).pluck(:key, :value).to_h
      
      # Get all questions with their stored or default values
      preference_values = category.preference_questions.ordered.each_with_object({}) do |question, result|
        stored_value = stored_preferences[question.key]
        
        # Handle different question types
        value = if stored_value.present?
                  case question.question_type
                  when 'checkbox'
                    JSON.parse(stored_value) rescue []
                  when 'boolean'
                    ActiveModel::Type::Boolean.new.cast(stored_value)
                  when 'number'
                    stored_value.to_f
                  else
                    stored_value
                  end
                else
                  question.typed_default_value
                end
        
        result[question.key] = value
      end
      
      {
        name: category.name,
        description: category.description,
        preferences: preference_values
      }
    end
    
    JSON.generate({
      updated_at: Time.now.iso8601,
      categories: preferences_data
    })
  end
end