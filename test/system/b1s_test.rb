require "application_system_test_case"

class B1sTest < ApplicationSystemTestCase
  setup do
    @b1 = b1s(:one)
  end

  test "visiting the index" do
    visit b1s_url
    assert_selector "h1", text: "B1s"
  end

  test "should create b1" do
    visit b1s_url
    click_on "New b1"

    fill_in "Name", with: @b1.name
    click_on "Create B1"

    assert_text "B1 was successfully created"
    click_on "Back"
  end

  test "should update B1" do
    visit b1_url(@b1)
    click_on "Edit this b1", match: :first

    fill_in "Name", with: @b1.name
    click_on "Update B1"

    assert_text "B1 was successfully updated"
    click_on "Back"
  end

  test "should destroy B1" do
    visit b1_url(@b1)
    click_on "Destroy this b1", match: :first

    assert_text "B1 was successfully destroyed"
  end
end
