require "test_helper"

class B2sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @b2 = b2s(:one)
  end

  test "should get index" do
    get b2s_url
    assert_response :success
  end

  test "should get new" do
    get new_b2_url
    assert_response :success
  end

  test "should create b2" do
    assert_difference("B2.count") do
      post b2s_url, params: { b2: { name: @b2.name } }
    end

    assert_redirected_to b2_url(B2.last)
  end

  test "should show b2" do
    get b2_url(@b2)
    assert_response :success
  end

  test "should get edit" do
    get edit_b2_url(@b2)
    assert_response :success
  end

  test "should update b2" do
    patch b2_url(@b2), params: { b2: { name: @b2.name } }
    assert_redirected_to b2_url(@b2)
  end

  test "should destroy b2" do
    assert_difference("B2.count", -1) do
      delete b2_url(@b2)
    end

    assert_redirected_to b2s_url
  end
end
