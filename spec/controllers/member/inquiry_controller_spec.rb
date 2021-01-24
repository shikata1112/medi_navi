require 'rails_helper'

RSpec.describe Member::InquiryController, type: :controller do
  describe "new" do
    it "/member/inquiry/newにアクセスできること" do
      get :new
      expect(response).to have_http_status(200)
    end
  end
  
  describe "confirm" do
    it "/member/inquiry/confirmにアクセスできること" do
      post :confirm
      expect(response).to have_http_status(200)
    end
  end

  describe "thanks" do
    it "/member/inquiry/thanksにアクセスできること" do
      get :thanks
      expect(response).to have_http_status(200)
    end
  end
end
