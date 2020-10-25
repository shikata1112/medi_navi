require 'rails_helper'

RSpec.describe Clinic, type: :model do

  before do
    @clinic = FactoryBot.build(:clinic)
  end

  describe "クリニック新規登録（admin）" do

    context "入力内容が空でないこと" do
      it "クリニックの登録ができること" do
        expect(@clinic).to be_valid
      end
    end

    context "バリデーションの有効性" do

      it "nameがnilの場合は登録できないこと" do
        @clinic.name = nil
        expect(@clinic).to be_invalid
      end

      it "doctorがnilの場合は登録できないこと" do
        @clinic.doctor = nil
        expect(@clinic).to be_invalid
      end

      it "addressがnilの場合は登録できないこと" do
        @clinic.address = nil
        expect(@clinic).to be_invalid
      end

      it "phone_numberがnilの場合は登録できないこと" do
        @clinic.phone_number = nil
        expect(@clinic).to be_invalid
      end

      it "postcodeがnilの場合は登録できないこと" do
        @clinic.postcode = nil
        expect(@clinic).to be_invalid
      end

      it "is_activeがtrueもしくはfalse以外では登録できないこと" do
        @clinic.is_active = nil
        expect(@clinic).to be_invalid
      end
      
    end

  end


end