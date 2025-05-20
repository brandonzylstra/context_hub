class PreferenceQuestion < ApplicationRecord
  # Associations
  belongs_to :category, class_name: 'PreferenceCategory', foreign_key: :category_id
  
  # Validations
  validates :key, presence: true, uniqueness: { scope: :category_id }
  validates :label, presence: true
  validates :question_type, presence: true
  
  # Scopes
  scope :required, -> { where(required: true) }
  scope :ordered, -> { order(position: :asc) }
  
  # Supported question types
  QUESTION_TYPES = %w[
    text
    textarea
    number
    boolean
    select
    radio
    checkbox
    file_path
  ].freeze
  
  # Validations for question type
  validates :question_type, inclusion: { in: QUESTION_TYPES }
  
  # Ensure options is present for select, radio, checkbox
  validate :validate_options_for_type
  
  # Methods
  def typed_default_value
    return nil if default_value.nil?
    
    case question_type
    when 'boolean'
      ActiveModel::Type::Boolean.new.cast(default_value)
    when 'number'
      default_value.to_f
    when 'checkbox'
      JSON.parse(default_value) rescue []
    else
      default_value
    end
  end
  
  def to_s
    label
  end
  
  def options_array
    return [] unless options.present?
    
    options.is_a?(Array) ? options : JSON.parse(options) rescue []
  end
  
  private
  
  def validate_options_for_type
    if %w[select radio checkbox].include?(question_type) && options_array.empty?
      errors.add(:options, "must be present for #{question_type} question type")
    end
  end
end
