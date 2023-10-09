require "test_helper"

class B1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @b1 = b1s(:one)
  end

  test "should get index" do
    get b1s_url
    assert_response :success
  end

  test "should get new" do
    get new_b1_url
    assert_response :success
  end

  test "should create b1" do
    assert_difference("B1.count") do
      post b1s_url, params: { b1: { name: @b1.name } }
    end

    assert_redirected_to b1_url(B1.last)
  end

  test "should show b1" do
    get b1_url(@b1)
    assert_response :success
  end

  test "should get edit" do
    get edit_b1_url(@b1)
    assert_response :success
  end

  test "should update b1" do
    patch b1_url(@b1), params: { b1: { name: @b1.name } }
    assert_redirected_to b1_url(@b1)
  end

  test "should destroy b1" do
    assert_difference("B1.count", -1) do
      delete b1_url(@b1)
    end

    assert_redirected_to b1s_url
  end
end
