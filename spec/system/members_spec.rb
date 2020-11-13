require 'rails_helper'

RSpec.describe 'Members', type: :system do
  before do
    @member = FactoryBot.create(:member)
  end

  it '会員は検索フォームからクリニックの詳細画面を表示する' do
    visit '/members/sign_in'
    fill_in 'member_email',	with: 'test@example.com'
    fill_in 'member_password',	with: '111111'
    click_button 'ログイン'
    visit root_path
    
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