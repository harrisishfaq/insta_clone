require "test_helper"

class SuggestionControllerTest < ActionDispatch::IntegrationTest
  test "should get create_suggestion" do
    get suggestion_create_suggestion_url
    assert_response :success
  end
end
