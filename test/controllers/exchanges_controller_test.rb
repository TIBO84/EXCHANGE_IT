require 'test_helper'

class ExchangesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get exchanges_create_url
    assert_response :success
  end

  test "should get update" do
    get exchanges_update_url
    assert_response :success
  end

  test "should get accept_user!" do
    get exchanges_accept_user!_url
    assert_response :success
  end

  test "should get accept_manager!" do
    get exchanges_accept_manager!_url
    assert_response :success
  end

end
