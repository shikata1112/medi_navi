require 'rails_helper'

RSpec.describe Api::ClinicsController, :type => :controller do
  describe "index" do
    it "/api/clinicsにアクセスできること" do
      get :index
      expect(response.status).to eq(200)
    end
  end
end