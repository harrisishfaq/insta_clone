require "test_helper"

class FriendsControllerTest < ActionDispatch::IntegrationTest
  test "should get friend_request" do
    get friends_friend_request_url
    assert_response :success
  end
end
