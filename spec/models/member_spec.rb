require 'rails_helper'

RSpec.describe Member, type: :model do

  before do
    @member = FactoryBot.build(:member)
  end

  describe "新規会員登録" do
    
    context "入力内容が空でないこと" do
      it "会員情報が正しく登録できること" do
        expect(@member).to be_valid
      end 
    end
    
    context "バリデーションの有効性" do

      it "nameがnilの場合は登録できないこと" do
        @member.name = nil
        expect(@member).to be_invalid
      end

      it "emailがnilの場合は登録できないこと" do
        @member.email = nil
        expect(@member).to be_invalid
      end

      it "postcodeが整数でない場合は登録できないこと" do
        @member.postcode = "aaaaaaa"
        expect(@member).to be_invalid
      end

      it "postcodeが7文字でない場合は登録できないこと" do
        @member.postcode = "123"
        expect(@member).to be_invalid
      end

      it "addressがnilの場合は登録できないこと" do
        @member.address = nil
        expect(@member).to be_invalid
      end

      it "birthdayがnilの場合は登録できないこと" do
        @member.birthday = nil
        expect(@member).to be_invalid
      end

      it "prefecture_codeがnilの場合は登録できないこと" do
        @member.prefecture_code = nil
        expect(@member).to be_invalid
      end

      it "is_deletedがnilの場合は登録できないこと" do
        @member.is_deleted = nil
        expect(@member).to be_invalid
      end

    end
  
  end

end
