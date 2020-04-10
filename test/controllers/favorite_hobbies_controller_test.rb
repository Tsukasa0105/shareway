require 'test_helper'

class FavoriteHobbiesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorite_hobbies_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_hobbies_destroy_url
    assert_response :success
  end

end
