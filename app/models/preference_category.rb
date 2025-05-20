class PreferenceCategory < ApplicationRecord
  # Associations
  has_many :preference_questions, -> { order(position: :asc) }, foreign_key: :category_id, dependent: :destroy
  
  # Validations
  validates :name, presence: true, uniqueness: true
  
  # Scopes
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :ordered, -> { order(name: :asc) }
  
  # Methods
  def to_s
    name
  end
  
  # Get all the questions with their default values as a hash
  def default_values_hash
    preference_questions.each_with_object({}) do |question, hash|
      hash[question.key] = question.default_value
    end
  end
  
  # Find a specific question by key
  def find_question(key)
    preference_questions.find_by(key: key)
  end
end
