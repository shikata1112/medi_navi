require 'rails_helper'

RSpec.describe 'Clinics', type: :system do
  describe "クリニックのあいまい検索機能" do
    let!(:member) { create(:member) }

    it '会員は検索フォームからクリニックの詳細画面を表示する' do
      login_member(member)
      expect(current_path).to eq root_path
      
      expect {
        find_by_id('search').click
        fill_in '検索フォーム', with: '大阪'
        click_button ' 検索する'
        visit '/clinics/search?utf8=%E2%9C%93&search=%E5%A4%A7%E9%98%AA&button='
        click_link '西中島南方クリニック'
        visit '/member/clinics/1'
      }
    end
  end
end