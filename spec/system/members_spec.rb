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
      it 'ログインに成功する' do
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
      it 'ログインに失敗する' do
        visit root_path
        click_link 'ログイン'

        fill_in 'member_email', with: ''
        fill_in 'member_password', with: '111111'
        click_button 'ログイン'

        expect(current_path).to eq new_member_session_path
      end
    end
  end

  describe 'ゲスト会員ログイン機能のテスト' do
    let!(:member) { create(:guest) }

    it 'ログインに成功する' do
      visit new_member_session_path
      click_on 'ゲストログイン'
  
      expect(current_path).to eq root_path
      expect(page).to have_content 'ゲスト'
    end
  end

  describe "会員プロフィール編集機能のテスト" do
    let!(:member) { create(:member, name: 'やまだ') }
    before do
      login_member(member)
    end

    context "フォームの入力が正常なとき" do
      it "会員情報が更新できること" do
        visit edit_member_member_path(member.id)
        expect(page).to have_field 'name_field', with: 'やまだ'  

        fill_in 'member_birthday',	with: '1999-11-12'
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

    context "フォームの入力が正常でないとき" do
      it "会員情報の更新に失敗すること" do
        visit edit_member_member_path(member.id)

        fill_in 'member_birthday',	with: '1999-11-12'
        fill_in 'member_postcode', with: '6570042'
        fill_in 'member_address', with: ''
        choose 'member_sex_false'
        click_button '更新する'

        expect(page).to have_content '正しい値を入力してください。'  
        visit edit_member_member_path(member.id)
      end
    end
    
  end

  describe "ゲスト会員プロフィール編集機能のテスト" do
    let!(:guest) { create(:guest) }

    it '入力フォームが無効であること' do
      visit new_member_session_path
      click_on 'ゲストログイン'

      find('.nav-member_name').click
      click_link 'プロフィール編集'

      expect(find('#guest_name')).to be_disabled
      expect(find('#guest_birthday')).to be_disabled
      expect(find('#guest_sex_true')).to be_disabled
      expect(find('#guest_postcode')).to be_disabled
      expect(find('#guest_address')).to be_disabled
    end
  end

  describe "会員退会機能のテスト" do
    context "会員の場合" do
      let!(:member) { create(:member) }

      it "退会した会員はログインに失敗する" do
        login_member(member)

        visit member_member_path(member)
        click_link '退会する'
        click_on '退会する'

        expect {
          expect(page.driver.browser.switch_to.alert.text).to eq "本当に退会しますか？"
          page.driver.browser.switch_to.alert.accept
          expect(current_path).to eq new_member_session_path
        }
        
        login_member(member)

        expect(current_path).to eq new_member_session_path
        expect(page).to have_content '会員ログイン'  
      end
    end

    context "ゲスト会員の場合" do
      let!(:guest) { create(:guest) }

      it "退会ボタンが無効であること" do
        visit new_member_session_path
        click_on 'ゲストログイン'

        visit member_member_path(guest)
        click_link '退会する'
        click_link '退会する'

        expect(current_path).to eq resignation_path
      end
    end
  end
  
end