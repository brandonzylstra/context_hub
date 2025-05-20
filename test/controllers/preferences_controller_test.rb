require "test_helper"

class PreferencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get preferences_index_url
    assert_response :success
  end

  test "should get show" do
    get preferences_show_url
    assert_response :success
  end

  test "should get edit" do
    get preferences_edit_url
    assert_response :success
  end

  test "should get update" do
    get preferences_update_url
    assert_response :success
  end
end
