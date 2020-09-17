require 'test_helper'

class Member::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get member_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get member_favorites_destroy_url
    assert_response :success
  end

end
