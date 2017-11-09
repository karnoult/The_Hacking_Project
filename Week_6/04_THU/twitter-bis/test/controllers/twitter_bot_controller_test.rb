require 'test_helper'

class TwitterBotControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get twitter_bot_index_url
    assert_response :success
  end

end
