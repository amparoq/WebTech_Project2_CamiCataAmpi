require "application_system_test_case"

class TagsTicketsTest < ApplicationSystemTestCase
  setup do
    @tags_ticket = tags_tickets(:one)
  end

  test "visiting the index" do
    visit tags_tickets_url
    assert_selector "h1", text: "Tags tickets"
  end

  test "should create tags ticket" do
    visit tags_tickets_url
    click_on "New tags ticket"

    click_on "Create Tags ticket"

    assert_text "Tags ticket was successfully created"
    click_on "Back"
  end

  test "should update Tags ticket" do
    visit tags_ticket_url(@tags_ticket)
    click_on "Edit this tags ticket", match: :first

    click_on "Update Tags ticket"

    assert_text "Tags ticket was successfully updated"
    click_on "Back"
  end

  test "should destroy Tags ticket" do
    visit tags_ticket_url(@tags_ticket)
    click_on "Destroy this tags ticket", match: :first

    assert_text "Tags ticket was successfully destroyed"
  end
end
