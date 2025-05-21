class UserPreference < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :key, presence: true, uniqueness: { scope: :name }
  
  # Scopes
  scope :by_name, ->(name) { where(name: name) }
  
  # Class methods for preference access
  class << self
    def get(name, key, default = nil)
      preference = find_by(name: name, key: key)
      preference&.typed_value || default
    end
    
    def set(name, key, value)
      preference = find_or_initialize_by(name: name, key: key)
      preference.value = value.is_a?(String) ? value : value.to_json
      if preference.save
        true
      else
        false
      end
    end
    
    # Get all preferences for a specific category
    def for_name(name)
      by_name(name).pluck(:key, :value).to_h
    end
  end
  
  # Instance methods
  def typed_value
    return nil if value.nil?
    
    begin
      JSON.parse(value)
    rescue JSON::ParserError
      value
    end
  end
end
