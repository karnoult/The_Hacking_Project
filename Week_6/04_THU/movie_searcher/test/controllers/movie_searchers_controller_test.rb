require 'test_helper'

class MovieSearchersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get movie_searchers_index_url
    assert_response :success
  end

end
