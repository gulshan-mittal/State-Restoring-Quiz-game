require 'test_helper'

class LeaderboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get lgenre" do
    get leaderboards_lgenre_url
    assert_response :success
  end

  test "should get lsub_genre" do
    get leaderboards_lsub_genre_url
    assert_response :success
  end

  test "should get lquiz" do
    get leaderboards_lquiz_url
    assert_response :success
  end

end
