require "application_system_test_case"

class B2sTest < ApplicationSystemTestCase
  setup do
    @b2 = b2s(:one)
  end

  test "visiting the index" do
    visit b2s_url
    assert_selector "h1", text: "B2s"
  end

  test "should create b2" do
    visit b2s_url
    click_on "New b2"

    fill_in "Name", with: @b2.name
    click_on "Create B2"

    assert_text "B2 was successfully created"
    click_on "Back"
  end

  test "should update B2" do
    visit b2_url(@b2)
    click_on "Edit this b2", match: :first

    fill_in "Name", with: @b2.name
    click_on "Update B2"

    assert_text "B2 was successfully updated"
    click_on "Back"
  end

  test "should destroy B2" do
    visit b2_url(@b2)
    click_on "Destroy this b2", match: :first

    assert_text "B2 was successfully destroyed"
  end
end
