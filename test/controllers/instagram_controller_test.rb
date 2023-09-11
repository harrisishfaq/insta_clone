require "test_helper"

class InstagramControllerTest < ActionDispatch::IntegrationTest
  test "should get home_page" do
    get instagram_home_page_url
    assert_response :success
  end

  test "should get landing_page" do
    get instagram_landing_page_url
    assert_response :success
  end
end
