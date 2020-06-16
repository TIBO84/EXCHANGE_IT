require 'test_helper'

class SupervisesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get supervises_home_url
    assert_response :success
  end

  test "should get stat" do
    get supervises_stat_url
    assert_response :success
  end

end
