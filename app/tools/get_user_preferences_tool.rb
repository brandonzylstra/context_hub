# frozen_string_literal: true

class GetUserPreferencesTool < ApplicationTool
  description "Get user's preferences by category"

  arguments do
    required(:category).filled(:string).description("Category name for preferences")
  end

  def call(category:)
    category_record = PreferenceCategory.find_by(name: category)
    return { error: "Category not found" } unless category_record

    # Get stored preferences for this category
    preferences = UserPreference.by_name(category).pluck(:key, :value).to_h
    
    # Get all question definitions for this category
    questions = category_record.preference_questions.ordered.map do |q|
      {
        key: q.key,
        label: q.label,
        description: q.description,
        type: q.question_type,
        required: q.required,
        options: q.options_array,
        default_value: q.typed_default_value
      }
    end

    # For each question in the category, return either the stored preference or the default value
    values = category_record.preference_questions.each_with_object({}) do |question, result|
      stored_value = preferences[question.key]
      result[question.key] = if stored_value.present?
                               question.question_type == 'checkbox' ? JSON.parse(stored_value) : stored_value
                             else
                               question.typed_default_value
                             end
    end

    {
      category: category,
      description: category_record.description,
      questions: questions,
      values: values
    }
  end
end