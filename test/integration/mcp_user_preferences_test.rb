require "test_helper"

class McpUserPreferencesTest < ActiveSupport::TestCase
  def setup
    @category_name = "IntegrationCat#{SecureRandom.hex(4)}"
    @category = PreferenceCategory.create!(name: @category_name, description: "desc", active: true)
    @question = @category.preference_questions.create!(
      key: "foo#{SecureRandom.hex(4)}",
      label: "Foo",
      question_type: "text",
      default_value: "bar",
      position: 1
    )
    UserPreference.create!(name: @category.name, key: @question.key, value: "baz")
  end

  test "MCP UserPreferencesResource is properly defined" do
    # Check that UserPreferencesResource exists
    assert defined?(UserPreferencesResource), "UserPreferencesResource class should be defined"
    
    # Verify the resource class inherits from ApplicationResource
    assert_includes UserPreferencesResource.ancestors, ApplicationResource
    
    # Check the resource has the necessary uri, resource_name, and mime_type class methods defined
    assert UserPreferencesResource.respond_to?(:uri, true), "Should have uri method"
    assert UserPreferencesResource.respond_to?(:resource_name, true), "Should have resource_name method"
    assert UserPreferencesResource.respond_to?(:description, true), "Should have description method"
    assert UserPreferencesResource.respond_to?(:mime_type, true), "Should have mime_type method"
    
    # Check the resource has the content instance method defined
    assert UserPreferencesResource.method_defined?(:content) || 
           UserPreferencesResource.private_method_defined?(:content), 
           "Should have content method"
    
    # Check that we have necessary data
    assert_operator PreferenceCategory.count, :>, 0, "No preference categories exist"
    assert_operator PreferenceQuestion.count, :>, 0, "No preference questions exist"
    assert_operator UserPreference.count, :>, 0, "No user preferences exist"
  end
end
