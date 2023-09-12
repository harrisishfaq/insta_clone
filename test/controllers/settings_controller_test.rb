require "test_helper"

class SettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setting = settings(:one)
  end

  test "should get index" do
    get settings_url
    assert_response :success
  end

  test "should get new" do
    get new_setting_url
    assert_response :success
  end

  test "should create setting" do
    assert_difference("Setting.count") do
      post settings_url, params: { setting: { account_status: @setting.account_status, public: @setting.public, show_me_in_suggestions: @setting.show_me_in_suggestions, someone_can_comment_on_post: @setting.someone_can_comment_on_post, someone_can_mention_me: @setting.someone_can_mention_me, someone_can_search_me: @setting.someone_can_search_me } }
    end

    assert_redirected_to setting_url(Setting.last)
  end

  test "should show setting" do
    get setting_url(@setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_setting_url(@setting)
    assert_response :success
  end

  test "should update setting" do
    patch setting_url(@setting), params: { setting: { account_status: @setting.account_status, public: @setting.public, show_me_in_suggestions: @setting.show_me_in_suggestions, someone_can_comment_on_post: @setting.someone_can_comment_on_post, someone_can_mention_me: @setting.someone_can_mention_me, someone_can_search_me: @setting.someone_can_search_me } }
    assert_redirected_to setting_url(@setting)
  end

  test "should destroy setting" do
    assert_difference("Setting.count", -1) do
      delete setting_url(@setting)
    end

    assert_redirected_to settings_url
  end
end
