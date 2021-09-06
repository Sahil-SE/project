require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get creatordash" do
    get dashboard_creatordash_url
    assert_response :success
  end

  test "should get assessordash" do
    get dashboard_assessordash_url
    assert_response :success
  end

  test "should get userdash" do
    get dashboard_userdash_url
    assert_response :success
  end
end
