require "test_helper"

class PreferenceCategoryTest < ActiveSupport::TestCase
  def setup
    @category = PreferenceCategory.create!(name: "Test Category", description: "A test category", active: true)
  end

  test "should be valid with valid attributes" do
    assert @category.valid?
  end

  test "should require a unique name" do
    dup = PreferenceCategory.new(name: "Test Category")
    assert_not dup.valid?
    assert_includes dup.errors[:name], "has already been taken"
  end

  test "should have many preference_questions" do
    q1 = @category.preference_questions.create!(key: "foo", label: "Foo", question_type: "text", position: 1)
    q2 = @category.preference_questions.create!(key: "bar", label: "Bar", question_type: "number", position: 2)
    assert_equal 2, @category.preference_questions.count
    assert_equal [q1, q2], @category.preference_questions.ordered
  end

  test "default_values_hash returns correct hash" do
    @category.preference_questions.create!(key: "foo", label: "Foo", question_type: "text", default_value: "abc", position: 1)
    @category.preference_questions.create!(key: "bar", label: "Bar", question_type: "number", default_value: "42", position: 2)
    hash = @category.default_values_hash
    assert_equal "abc", hash["foo"]
    assert_equal "42", hash["bar"]
  end

  test "find_question returns correct question" do
    q = @category.preference_questions.create!(key: "baz", label: "Baz", question_type: "text", position: 1)
    assert_equal q, @category.find_question("baz")
    assert_nil @category.find_question("not_found")
  end
end
