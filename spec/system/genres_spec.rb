require 'rails_helper'

RSpec.describe 'Genres', type: :system do
  describe "診療科目新規登録のテスト" do
    let!(:admin) { create(:admin) }

    context '入力が正しいとき' do
      it '診療科目の登録に成功する' do
        login_admin(admin)

        click_link '診療科目一覧'
        click_link '追加する'
        fill_in 'medical_department_field',	with: "整形外科" 
        click_button '新規登録'
        
        expect(current_path).to eq admin_genres_path
        expect(page).to have_content '診療科目を登録しました。'
        expect(page).to have_content '整形外科'  
      end
    end

    context '入力内容が空のとき' do
      it '診療科目の登録に失敗する' do
        login_admin(admin)

        click_link '診療科目一覧'
        click_link '追加する'
        fill_in 'medical_department_field',	with: " " 
        click_button '新規登録'

        expect(page).to have_content '診療科目名が空欄またはすでに登録されています。'  
        expect(current_path).to eq new_admin_genre_path  
      end
    end

    context '入力内容がすでに登録されているとき' do
      let!(:genre) { create(:genre, medical_department: '心療内科') }
      it '診療科目の登録に失敗する' do
        login_admin(admin)

        click_link '診療科目一覧'
        click_link '追加する'
        fill_in 'medical_department_field',	with: "心療内科" 
        click_button '新規登録'

        expect(page).to have_content '診療科目名が空欄またはすでに登録されています。'  
        expect(current_path).to eq new_admin_genre_path  
      end
    end
  end

  describe "診療科目編集のテスト" do
    let!(:admin) { create(:admin) }
    let!(:genre) { create(:genre, medical_department: '整形外科') }
    let!(:genre2) { create(:genre2, medical_department: '眼科') }

    context '入力内容が正しいとき' do
      it '診療科目の編集に成功する' do
        login_admin(admin)

        click_link '診療科目一覧'
        click_link '編集', match: :first
        fill_in 'medical_department_field',	with: "内科" 
        click_button '更新'

        expect(page).to have_content '内科'
        expect(page).to have_content '診療科目を更新しました。'
        expect(current_path).to eq admin_genres_path
      end
    end

    context '入力内容が空のとき' do
      it '診療科目の編集に失敗する' do
        login_admin(admin)

        click_link '診療科目一覧'
        click_link '編集', match: :first
        fill_in 'medical_department_field',	with: " " 
        click_button '更新'

        expect(page).to have_content '診療科目名が空欄またはすでに登録されています。'
        expect(current_path).to eq edit_admin_genre_path(genre.id)
      end
    end

    context '入力内容がすでに登録されているとき' do

      it '診療科目の編集に失敗する' do
        login_admin(admin)

        click_link '診療科目一覧'
        click_link '編集', match: :first

        fill_in 'medical_department_field',	with: "眼科" 
        click_button '更新'

        expect(page).to have_content '診療科目名が空欄またはすでに登録されています。'
        expect(current_path).to eq edit_admin_genre_path(genre.id)
      end
    end
  end

  describe "診療科目削除のテスト" do
    let!(:admin) { create(:admin) }
    let!(:genre) { create(:genre, medical_department: '整形外科') }

    it '診療科目の削除に成功する' do
      login_admin(admin)

      click_link '診療科目一覧'
      click_link '削除'

      expect {
        expect(page.driver.browser.switch_to.alert.text).to eq "#{genre.medical_department} を本当に削除しますか？"
        page.driver.browser.switch_to.alert.accept

        expect(current_path).to eq admin_genres_path
        expect(page).to have_content '診療科目を削除しました。'  
      }
    end
  end

end