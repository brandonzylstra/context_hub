require "test_helper"

class UserPreferenceTest < ActiveSupport::TestCase
  def setup
    @category = PreferenceCategory.create!(name: "Prefs", description: "desc", active: true)
    @question = @category.preference_questions.create!(
      key: "foo",
      label: "Foo",
      question_type: "text",
      default_value: "bar",
      position: 1
    )
    @pref = UserPreference.create!(name: "Prefs", key: "foo", value: "bar")
  end

  test "should be valid with valid attributes" do
    assert @pref.valid?
  end

  test "should require name and key" do
    up = UserPreference.new
    assert_not up.valid?
    assert_includes up.errors[:name], "can't be blank"
    assert_includes up.errors[:key], "can't be blank"
  end

  test "should require unique key within name" do
    dup = UserPreference.new(name: "Prefs", key: "foo", value: "baz")
    assert_not dup.valid?
    assert_includes dup.errors[:key], "has already been taken"
  end

  test "get and set class methods" do
    assert_equal "bar", UserPreference.get("Prefs", "foo")
    UserPreference.set("Prefs", "foo", "baz")
    assert_equal "baz", UserPreference.get("Prefs", "foo")
  end

  test "for_name returns all preferences for a name" do
    UserPreference.set("Prefs", "bar", "val2")
    hash = UserPreference.for_name("Prefs")
    assert_equal "bar", hash["foo"]
    assert_equal "val2", hash["bar"]
  end

  test "typed_value parses JSON if possible" do
    up = UserPreference.create!(name: "Prefs", key: "arr", value: "[1,2,3]")
    assert_equal [1,2,3], up.typed_value
    up2 = UserPreference.create!(name: "Prefs", key: "str", value: "plain")
    assert_equal "plain", up2.typed_value
  end
end
