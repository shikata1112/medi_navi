require 'rails_helper'

RSpec.describe 'Clinics', :type => :system do

  describe "入力フォームからのあいまい検索機能のテスト" do
    let!(:member) { create(:member) }
    let!(:clinic) { create(:clinic) }

    context '条件と一致するクリニックが見つかった場合' do
      it '検索フォームからクリニックの詳細画面を表示する' do
        login_member(member)
        
        fill_in 'search', :with => 'test'
        click_button '検索する'
        click_link 'testクリニック'

        expect(current_path).to eq member_clinic_path(clinic)
        expect(page).to have_content 'testクリニック'
        expect(page).to have_content 'test太郎'
        expect(page).to have_content '1231111'
        expect(page).to have_content '大阪府大阪市中央区test'
      end
    end
    
    context '条件と一致するクリニックが見つからない場合' do
      it 'クリニックを表示しない' do
        login_member(member)

        fill_in 'search',	:with => 'あいうえお'
        click_button '検索する'

        expect(page).to have_content '該当するクリニックが見つかりませんでした。'  
        expect(page).to have_field 'search', :with => 'あいうえお' 
        click_link 'TOPに戻る'
        expect(current_path).to eq root_path  
      end
    end
  end

  describe "診療科目検索機能のテスト" do
    let!(:member) { create(:member) }
    let!(:clinic) { create(:clinic) }
    let!(:genre) { create(:genre, :medical_department => '整形外科') }
    let!(:genre2) { create(:genre, :medical_department => '眼科') }
    let!(:genre_map) { create(:genre_map) }

    context '選択した都道府県に一致するクリニックが見つかった場合' do
      it '条件に一致するクリニックの詳細画面を表示する' do
        login_member(member)

        click_on 'genre_link', :visible => '整形外科', :match => :first
        click_link 'testクリニック'

        expect(page).to have_content 'testクリニック'
        expect(page).to have_content 'test太郎'
        expect(page).to have_content '大阪府大阪市中央区test'
      end
    end

    context "条件に一致するクリニックが見つからない場合" do
      it 'クリニックを表示しない' do
        login_member(member)

        click_on '眼科', :match => :first

        expect(page).to have_content '条件に該当するクリニックはありません。'
      end
    end
    
  end
  
end