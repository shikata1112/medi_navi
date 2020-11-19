require 'rails_helper'

RSpec.describe 'Members', type: :system do
  
  describe '新規会員登録機能のテスト' do
    context 'フォームの入力が正常なとき' do
      it '新規会員登録が成功' do
        visit root_path
        click_link '新規登録'
        fill_in 'member_name', with: '山田太朗'
        fill_in 'member_email', with: 'yamada@gmail.com'
        fill_in 'member_postcode', with: '1111111'
        select '東京都', from: 'member_prefecture_code'
        fill_in 'member_address', with: '東京都台東区'
        choose 'member_sex_true'
        fill_in 'member_password', with: '111111'
        fill_in 'member_password_confirmation', with: '111111'
        click_button '新規登録'
      
        expect(current_path).to eq root_path
      end
    end

    context 'フォームの入力が正常ではないとき' do
      it '新規会員登録が失敗' do
        visit root_path
        click_link '新規登録'

        fill_in 'member_name', with: ''
        fill_in 'member_email', with: 'yamada@gmail.com'
        fill_in 'member_postcode', with: '1111111'
        select '東京都', from: 'member_prefecture_code'
        fill_in 'member_address', with: '東京都台東区'
        choose 'member_sex_true'
        fill_in 'member_password', with: '111111'
        fill_in 'member_password_confirmation', with: '111111'
        click_button '新規登録'
      
        expect(page).to have_content 'ニックネームを 入力してください。'
      end
    end
  end

  describe '会員ログイン機能のテスト' do
    let!(:member) { create(:member, email: 'test2@example.com') }

    context "フォームの入力が正常なとき" do
      it 'ログインが成功' do
        visit root_path
        click_link 'ログイン'
        expect(current_path).to eq new_member_session_path

        fill_in 'member_email', with: 'test2@example.com'
        fill_in 'member_password', with: '111111'
        click_button 'sign_in_button'

        expect(current_path).to eq root_path
      end
    end
    
    context 'フォームの入力が正常ではないとき' do
      it 'ログインが失敗' do
        visit root_path
        click_link 'ログイン'

        fill_in 'member_email', with: ''
        fill_in 'member_password', with: '111111'
        click_button 'ログイン'

        expect(current_path).to eq '/members/sign_in'
      end
    end
  end

  describe "会員プロフィール編集機能のテスト" do
    let!(:member) { create(:member, name: 'やまだ') }

    context "フォームの入力が正常なとき" do
      it "会員プロフィールが入力した内容で更新できる事" do
        login_member(member)

        visit edit_member_member_path(member.id)
        expect(page).to have_field 'name_field', with: 'やまだ'  

        fill_in "member_birthday",	with: '1999-11-12'
        fill_in 'member_postcode', with: '6570042'
        fill_in 'member_address', with: '兵庫県神戸市灘区烏帽子町'
        choose 'member_sex_false'
        click_button '更新する'
        

        expect(page).to have_content 'やまだ'
        expect(page).to have_content '女性'
        expect(page).to have_content '1999-11-12'
        expect(page).to have_content '6570042'
        expect(page).to have_content '兵庫県神戸市灘区烏帽子町'
      end
    end
    
  end
  
end