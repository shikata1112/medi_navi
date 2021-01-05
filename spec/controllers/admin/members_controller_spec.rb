require 'rails_helper'

RSpec.describe Admin::MembersController, type: :controller do
  describe 'index' do
    it 'CSVダウンロードが実行されること' do
      get :index, format: :csv

      expect(response.headers["Content-Type"]).to include "text/csv"
    end
  end
end