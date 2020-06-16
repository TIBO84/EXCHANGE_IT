require 'test_helper'

class ShiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shifts_new_url
    assert_response :success
  end

  test "should get create" do
    get shifts_create_url
    assert_response :success
  end

  test "should get update" do
    get shifts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get shifts_destroy_url
    assert_response :success
  end

  test "should get answer" do
    get shifts_answer_url
    assert_response :success
  end

end
