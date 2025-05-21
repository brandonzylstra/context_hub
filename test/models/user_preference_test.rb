require "test_helper"

class UserPreferenceTest < ActiveSupport::TestCase
  def setup
    @category_name = "Prefs#{SecureRandom.hex(4)}"
    @key_name = "foo#{SecureRandom.hex(4)}"
    @category = PreferenceCategory.create!(name: @category_name, description: "desc", active: true)
    @question = @category.preference_questions.create!(
      key: @key_name,
      label: "Foo",
      question_type: "text",
      default_value: "bar",
      position: 1
    )
    @pref = UserPreference.create!(name: @category_name, key: @key_name, value: "bar")
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
    dup = UserPreference.new(name: @category_name, key: @key_name, value: "baz")
    assert_not dup.valid?
    assert_includes dup.errors[:key], "has already been taken"
  end

  test "get and set class methods" do
    assert_equal "bar", UserPreference.get(@category_name, @key_name)
    UserPreference.set(@category_name, @key_name, "baz")
    assert_equal "baz", UserPreference.get(@category_name, @key_name)
  end

  test "for_name returns all preferences for a name" do
    UserPreference.set(@category_name, "bar#{SecureRandom.hex(4)}", "val2")
    hash = UserPreference.for_name(@category_name)
    assert_equal "bar", hash[@key_name]
    assert_equal "val2", hash.except(@key_name).values.first
  end

  test "typed_value parses JSON if possible" do
    up = UserPreference.create!(name: @category_name, key: "arr#{SecureRandom.hex(4)}", value: "[1,2,3]")
    assert_equal [1,2,3], up.typed_value
    up2 = UserPreference.create!(name: @category_name, key: "str#{SecureRandom.hex(4)}", value: "plain")
    assert_equal "plain", up2.typed_value
  end
end
