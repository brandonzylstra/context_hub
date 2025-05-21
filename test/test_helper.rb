ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # Disable parallel testing until we have proper isolation
  # parallelize(workers: :number_of_processors)
  parallelize(workers: 1)

  # We're not using fixtures for these tests to avoid uniqueness constraint issues
  # fixtures :all
  self.use_transactional_tests = true
  
  # Add more helper methods to be used by all tests here...
  
  setup do
    # Start each test with a clean database
    cleanup_database
  end
  
  teardown do
    # End each test with a clean database
    cleanup_database
  end
  
  def cleanup_database
    # Clear tables that have uniqueness constraints
    UserPreference.delete_all
    PreferenceQuestion.delete_all  
    PreferenceCategory.delete_all
  end
end
