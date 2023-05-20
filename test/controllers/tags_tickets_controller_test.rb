require "test_helper"

class TagsTicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tags_ticket = tags_tickets(:one)
  end

  test "should get index" do
    get tags_tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_tags_ticket_url
    assert_response :success
  end

  test "should create tags_ticket" do
    assert_difference("TagsTicket.count") do
      post tags_tickets_url, params: { tags_ticket: {  } }
    end

    assert_redirected_to tags_ticket_url(TagsTicket.last)
  end

  test "should show tags_ticket" do
    get tags_ticket_url(@tags_ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_tags_ticket_url(@tags_ticket)
    assert_response :success
  end

  test "should update tags_ticket" do
    patch tags_ticket_url(@tags_ticket), params: { tags_ticket: {  } }
    assert_redirected_to tags_ticket_url(@tags_ticket)
  end

  test "should destroy tags_ticket" do
    assert_difference("TagsTicket.count", -1) do
      delete tags_ticket_url(@tags_ticket)
    end

    assert_redirected_to tags_tickets_url
  end
end
