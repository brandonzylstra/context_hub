require "test_helper"

class PreferenceQuestionTest < ActiveSupport::TestCase
  def setup
    @category = PreferenceCategory.create!(name: "TestCat", description: "desc", active: true)
    @question = @category.preference_questions.create!(
      key: "foo",
      label: "Foo",
      question_type: "text",
      default_value: "bar",
      position: 1
    )
  end

  test "should be valid with valid attributes" do
    assert @question.valid?
  end

  test "should require key, label, and question_type" do
    q = PreferenceQuestion.new
    assert_not q.valid?
    assert_includes q.errors[:key], "can't be blank"
    assert_includes q.errors[:label], "can't be blank"
    assert_includes q.errors[:question_type], "can't be blank"
  end

  test "should require unique key within category" do
    dup = @category.preference_questions.new(key: "foo", label: "Other", question_type: "text", position: 2)
    assert_not dup.valid?
    assert_includes dup.errors[:key], "has already been taken"
  end

  test "should validate question_type inclusion" do
    q = @category.preference_questions.new(key: "bar", label: "Bar", question_type: "invalid", position: 2)
    assert_not q.valid?
    assert_includes q.errors[:question_type], "is not included in the list"
  end

  test "typed_default_value returns correct type" do
    q_bool = @category.preference_questions.create!(key: "b", label: "B", question_type: "boolean", default_value: "true", position: 2)
    assert_equal true, q_bool.typed_default_value

    q_num = @category.preference_questions.create!(key: "n", label: "N", question_type: "number", default_value: "42", position: 3)
    assert_equal 42.0, q_num.typed_default_value

    q_checkbox = @category.preference_questions.create!(key: "c", label: "C", question_type: "checkbox", default_value: '["a","b"]', position: 4)
    assert_equal ["a", "b"], q_checkbox.typed_default_value

    assert_equal "bar", @question.typed_default_value
  end

  test "options_array returns parsed options" do
    q = @category.preference_questions.create!(
      key: "sel",
      label: "Select",
      question_type: "select",
      options: '["one","two"]',
      position: 5
    )
    assert_equal ["one", "two"], q.options_array
  end

  test "validate_options_for_type requires options for select/radio/checkbox" do
    q = @category.preference_questions.new(key: "sel2", label: "Select2", question_type: "select", position: 6)
    assert_not q.valid?
    assert_includes q.errors[:options], "must be present for select question type"
  end
end
