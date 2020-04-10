require 'test_helper'

class FavoriteWaysControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorite_ways_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_ways_destroy_url
    assert_response :success
  end

end
