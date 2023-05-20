require "application_system_test_case"

class ExecutivesTest < ApplicationSystemTestCase
  setup do
    @executive = executives(:one)
  end

  test "visiting the index" do
    visit executives_url
    assert_selector "h1", text: "Executives"
  end

  test "should create executive" do
    visit executives_url
    click_on "New executive"

    click_on "Create Executive"

    assert_text "Executive was successfully created"
    click_on "Back"
  end

  test "should update Executive" do
    visit executive_url(@executive)
    click_on "Edit this executive", match: :first

    click_on "Update Executive"

    assert_text "Executive was successfully updated"
    click_on "Back"
  end

  test "should destroy Executive" do
    visit executive_url(@executive)
    click_on "Destroy this executive", match: :first

    assert_text "Executive was successfully destroyed"
  end
end
