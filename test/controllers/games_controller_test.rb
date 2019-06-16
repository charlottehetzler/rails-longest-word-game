require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get score" do
    get games_score_url
    assert_response :success
  end

end
