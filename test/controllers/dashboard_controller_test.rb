require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get creatordash" do
    get dashboard_creatordash_url
    assert_response :success
  end

  test "should get assesordash" do
    get dashboard_assesordash_url
    assert_response :success
  end

  test "should get userdash" do
    get dashboard_userdash_url
    assert_response :success
  end
end
