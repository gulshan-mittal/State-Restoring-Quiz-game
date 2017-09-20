require 'test_helper'

class SubGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sub_genres_new_url
    assert_response :success
  end

end
