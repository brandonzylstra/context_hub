# frozen_string_literal: true

class ListPreferenceCategoriesAndQuestionsTool < ApplicationTool
  description "List all available preference categories and their questions"

  arguments do
    optional(:active_only).filled(:bool).description("Only return active categories")
  end

  def call(active_only: true)
    categories = active_only ? PreferenceCategory.active : PreferenceCategory.all
    
    categories.ordered.map do |category|
      {
        name: category.name,
        description: category.description,
        active: category.active,
        questions: category.preference_questions.ordered.map do |question|
          {
            key: question.key,
            label: question.label,
            description: question.description,
            type: question.question_type,
            required: question.required,
            options: question.options_array,
            default_value: question.typed_default_value
          }
        end
      }
    end
  end
end