# frozen_string_literal: true

class AddCustomPreferenceTool < ApplicationTool
  description "Add a custom preference question"

  arguments do
    required(:category).filled(:string).description("Category name (existing or new)")
    required(:key).filled(:string).description("Unique key for the preference")
    required(:label).filled(:string).description("User-friendly label for the preference")
    required(:question_type).filled(:string).description("Type of question (text, textarea, number, boolean, select, radio, checkbox, file_path)")
    optional(:description).filled(:string).description("Description of what this preference is for")
    optional(:default_value).description("Default value for this preference")
    optional(:required).filled(:bool).description("Whether this is a required preference")
    optional(:options).filled(:array).description("For select/radio/checkbox types, the available options")
    optional(:category_description).filled(:string).description("Description for the category if it's being created")
  end

  def call(category:, key:, label:, question_type:, description: nil, default_value: nil, required: false, options: [], category_description: nil)
    # Find or create the category
    category_record = PreferenceCategory.find_by(name: category)
    
    if category_record.nil?
      category_record = PreferenceCategory.create!(
        name: category,
        description: category_description || "Custom preference category",
        active: true
      )
    end

    # Get max position to place new question at the end
    max_position = category_record.preference_questions.maximum(:position) || 0

    # Create the new question
    question = PreferenceQuestion.create!(
      category: category_record,
      key: key,
      label: label,
      description: description,
      question_type: question_type,
      default_value: default_value.is_a?(Array) ? default_value.to_json : default_value.to_s,
      required: required,
      position: max_position + 1,
      options: options.to_json
    )

    {
      success: true,
      category: category_record.name,
      question: {
        key: question.key,
        label: question.label,
        description: question.description,
        type: question.question_type,
        required: question.required,
        options: question.options_array,
        default_value: question.typed_default_value
      }
    }
  rescue ActiveRecord::RecordInvalid => e
    { error: e.message }
  end
end