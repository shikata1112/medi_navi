require 'rails_helper'

RSpec.describe 'Admins', type: :system do

  describe "管理者ログイン機能のテスト" do
    let!(:admin) { create(:admin) }
    
    it '管理者ログインが成功' do
      visit new_admin_session_path

      fill_in 'メールアドレス',	with: 'admin@example.com'
      fill_in 'パスワード', with: '12345678'
      click_button 'ログイン'

      expect(current_path).to eq admin_members_top_path
    end
  end
  
end