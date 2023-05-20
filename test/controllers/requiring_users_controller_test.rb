require "test_helper"

class RequiringUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @requiring_user = requiring_users(:one)
  end

  test "should get index" do
    get requiring_users_url
    assert_response :success
  end

  test "should get new" do
    get new_requiring_user_url
    assert_response :success
  end

  test "should create requiring_user" do
    assert_difference("RequiringUser.count") do
      post requiring_users_url, params: { requiring_user: {  } }
    end

    assert_redirected_to requiring_user_url(RequiringUser.last)
  end

  test "should show requiring_user" do
    get requiring_user_url(@requiring_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_requiring_user_url(@requiring_user)
    assert_response :success
  end

  test "should update requiring_user" do
    patch requiring_user_url(@requiring_user), params: { requiring_user: {  } }
    assert_redirected_to requiring_user_url(@requiring_user)
  end

  test "should destroy requiring_user" do
    assert_difference("RequiringUser.count", -1) do
      delete requiring_user_url(@requiring_user)
    end

    assert_redirected_to requiring_users_url
  end
end
