require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get pages_login_url
    assert_response :success
  end

  test "should get fma" do
    get pages_fma_url
    assert_response :success
  end

  test "should get unit" do
    get pages_unit_url
    assert_response :success
  end

  test "should get edit" do
    get pages_edit_url
    assert_response :success
  end
end
