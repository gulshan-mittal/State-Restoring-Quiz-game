require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get SignUp" do
    get users_new_path
    assert_response :success
  end

  test "should get Home" do
    get root_path
    assert_response :success
  end

  test "should get About" do
    get about_path
    assert_response :success
  end

end
