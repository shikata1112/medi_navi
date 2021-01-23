require 'rails_helper'

RSpec.describe Admin::InquiryController, type: :controller do
  describe "index" do
    it "/admin/inquiryにアクセスできること" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "show" do
    before do
      @inquiry = create(:inquiry)
    end

    it "/admin/inquiry/:idにアクセスできること" do
      get :show, params: {id: @inquiry.id}
      expect(response).to have_http_status(200)
    end
  end
end