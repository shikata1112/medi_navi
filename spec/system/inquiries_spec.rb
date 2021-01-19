require 'rails_helper'

RSpec.describe 'Inquiries', type: :system do
  describe "問い合わせのテスト" do
    let!(:member) { create(:member) }

    context '入力が正しいとき' do
      it '問い合わせの登録に成功する' do
        login_member(member)

        visit '/member/inquiry/new'
        fill_in 'inquiry-title',	with: "test" 
        fill_in 'inquiry-content',	with: "テストの問い合わせ" 
        click_button '確認画面へ'
        
        expect(current_path).to eq member_inquiry_confirm_path

        click_button '内容を送信する'

        expect(current_path).to eq member_inquiry_thanks_path
        expect(page).to have_content '問い合わせが完了しました'  
      end
    end

    context '入力が正しくないとき' do
      it '問い合わせの登録に失敗しエラーメッセージを表示する' do
        login_member(member)

        visit '/member/inquiry/new'
        fill_in 'inquiry-title',	with: "test"
        fill_in 'inquiry-content', with: " "
        click_button '確認画面へ'

        expect(current_path).to eq member_inquiry_confirm_path
        expect(page).to have_content '本文を入力してください'
      end
    end
  end
end