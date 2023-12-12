require "test_helper"

class UserInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_info_show_url
    assert_response :success
  end

  test "should get create" do
    get user_info_create_url
    assert_response :success
  end

  test "should get update" do
    get user_info_update_url
    assert_response :success
  end
end
