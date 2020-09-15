require 'test_helper'

class Member::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get member_reviews_new_url
    assert_response :success
  end

  test "should get index" do
    get member_reviews_index_url
    assert_response :success
  end

  test "should get create" do
    get member_reviews_create_url
    assert_response :success
  end

  test "should get destroy" do
    get member_reviews_destroy_url
    assert_response :success
  end

end
