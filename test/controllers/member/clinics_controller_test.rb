require 'test_helper'

class Member::ClinicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_clinics_index_url
    assert_response :success
  end

  test "should get show" do
    get member_clinics_show_url
    assert_response :success
  end

end
