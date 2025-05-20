# frozen_string_literal: true

class SetUserPreferenceTool < ApplicationTool
  description "Set a user preference value"

  arguments do
    required(:category).filled(:string).description("Category name for the preference")
    required(:key).filled(:string).description("Preference key to set")
    required(:value).description("Value to store for the preference")
  end

  def call(category:, key:, value:)
    category_record = PreferenceCategory.find_by(name: category)
    return { error: "Category not found" } unless category_record

    question = category_record.preference_questions.find_by(key: key)
    return { error: "Preference key not found in category" } unless question

    # Handle array values for checkbox type
    value_to_store = question.question_type == 'checkbox' ? value.to_json : value.to_s

    # Store the preference
    stored = UserPreference.set(category, key, value_to_store)
    
    { 
      success: true, 
      category: category, 
      key: key, 
      stored_value: stored
    }
  end
end