require "test_helper"

class PreferencesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category_name = "TestCat#{SecureRandom.hex(4)}"
    @category = PreferenceCategory.create!(name: @category_name, description: "desc", active: true)
    @question = @category.preference_questions.create!(
      key: "foo#{SecureRandom.hex(4)}",
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
    assert_select "h1", text: /#{@category.name}/
  end

  test "should get edit" do
    get edit_preference_url(@category.name)
    assert_response :success
    assert_select "h1", text: /Edit #{@category.name}/
  end

  test "should update preferences" do
    patch preference_url(@category.name), params: { preferences: { @question.key => "baz" } }
    assert_redirected_to preference_url(@category.name)
    follow_redirect!
    assert_match /1 preference updated successfully/, response.body
    assert_equal "baz", UserPreference.get(@category.name, @question.key)
  end

  test "should create category" do
    unique_name = "NewCat#{SecureRandom.hex(4)}"
    assert_difference "PreferenceCategory.count", 1 do
      post preferences_url, params: { preference_category: { name: unique_name, description: "desc", active: true } }
    end
    assert_redirected_to preferences_url
    follow_redirect!
    assert_match /Category .+?#{unique_name}.+? was created successfully/, response.body
  end

  test "should add question to category" do
    unique_key = "bar#{SecureRandom.hex(4)}"
    assert_difference -> { @category.reload.preference_questions.count } do
      post add_question_preference_url(@category.name), params: {
        preference_question: {
          label: "Bar",
          key: unique_key,
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
    assert_match /Question .+?Bar.+? was added successfully/, response.body
  end
end
