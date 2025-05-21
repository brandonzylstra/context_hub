require "test_helper"

class McpUserPreferencesTest < ActionDispatch::IntegrationTest
  def setup
    @category = PreferenceCategory.create!(name: "IntegrationCat", description: "desc", active: true)
    @question = @category.preference_questions.create!(
      key: "foo",
      label: "Foo",
      question_type: "text",
      default_value: "bar",
      position: 1
    )
    UserPreference.create!(name: @category.name, key: @question.key, value: "baz")
  end

  test "GET /mcp/user_preferences returns preferences JSON" do
    get "/mcp/user_preferences"
    assert_response :success
    json = JSON.parse(response.body)
    assert json["categories"].is_a?(Array)
    cat = json["categories"].find { |c| c["name"] == @category.name }
    assert_not_nil cat
    assert_equal @category.description, cat["description"]
    assert_equal "baz", cat["preferences"]["foo"]
  end
end
