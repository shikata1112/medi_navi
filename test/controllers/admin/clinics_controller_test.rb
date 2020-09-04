require 'test_helper'

class Admin::ClinicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_clinics_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_clinics_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_clinics_edit_url
    assert_response :success
  end

end
