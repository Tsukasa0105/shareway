require 'test_helper'

class WaysControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ways_create_url
    assert_response :success
  end

  test "should get edit" do
    get ways_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get ways_destroy_url
    assert_response :success
  end

end
