require 'test_helper'

class EnjoyedWaysControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get enjoyed_ways_create_url
    assert_response :success
  end

  test "should get destroy" do
    get enjoyed_ways_destroy_url
    assert_response :success
  end

end
