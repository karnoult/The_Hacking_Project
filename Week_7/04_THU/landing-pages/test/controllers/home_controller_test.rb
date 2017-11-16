require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get checkr" do
    get home_checkr_url
    assert_response :success
  end

  test "should get sparks" do
    get home_sparks_url
    assert_response :success
  end

end
