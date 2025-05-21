require "test_helper"

class PreferencesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = PreferenceCategory.create!(name: "TestCat", description: "desc", active: true)
    @question = @category.preference_questions.create!(
      key: "foo",
      label: "Foo",
      question_type: "text",
      default_value: "bar",
      position: 1
    )
    @pref = UserPreference.create!(name: @category.name, key: @question.key, value: "bar")
  end

  test "should get index" do
    get preferences_url
    assert_response :success
    assert_select "h1", /Preference Categories/
  end

  test "should get show" do
    get preference_url(@category.name)
    assert_response :success
    assert_select "h1", /#{@category.name}/
  end

  test "should get edit" do
    get edit_preference_url(@category.name)
    assert_response :success
    assert_select "h1", /Edit #{@category.name}/
  end

  test "should update preferences" do
    patch preference_url(@category.name), params: { preferences: { foo: "baz" } }
    assert_redirected_to preference_url(@category.name)
    follow_redirect!
    assert_match /Preferences updated successfully/, response.body
    assert_equal "baz", UserPreference.get(@category.name, "foo")
  end

  test "should create category" do
    assert_difference "PreferenceCategory.count", 1 do
      post preferences_url, params: { preference_category: { name: "NewCat", description: "desc", active: true } }
    end
    assert_redirected_to preferences_url
    follow_redirect!
    assert_match /Category created successfully/, response.body
  end

  test "should add question to category" do
    assert_difference "@category.preference_questions.count", 1 do
      post add_question_preference_url(@category.name), params: {
        preference_question: {
          label: "Bar",
          key: "bar",
          question_type: "text",
          description: "desc",
          default_value: "baz",
          required: false,
          options: ""
        }
      }
    end
    assert_redirected_to edit_preference_url(@category.name)
    follow_redirect!
    assert_match /Question added successfully/, response.body
  end
end
