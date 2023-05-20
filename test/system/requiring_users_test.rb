require "application_system_test_case"

class RequiringUsersTest < ApplicationSystemTestCase
  setup do
    @requiring_user = requiring_users(:one)
  end

  test "visiting the index" do
    visit requiring_users_url
    assert_selector "h1", text: "Requiring users"
  end

  test "should create requiring user" do
    visit requiring_users_url
    click_on "New requiring user"

    click_on "Create Requiring user"

    assert_text "Requiring user was successfully created"
    click_on "Back"
  end

  test "should update Requiring user" do
    visit requiring_user_url(@requiring_user)
    click_on "Edit this requiring user", match: :first

    click_on "Update Requiring user"

    assert_text "Requiring user was successfully updated"
    click_on "Back"
  end

  test "should destroy Requiring user" do
    visit requiring_user_url(@requiring_user)
    click_on "Destroy this requiring user", match: :first

    assert_text "Requiring user was successfully destroyed"
  end
end
