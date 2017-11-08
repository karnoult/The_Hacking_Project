require 'test_helper'

class ElgoogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get elgoogs_index_url
    assert_response :success
  end

end
