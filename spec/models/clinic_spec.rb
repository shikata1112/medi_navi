require 'rails_helper'

RSpec.describe Clinic, type: :model do

  describe "クリニック新規登録（admin）" do

    before do
      @clinic = build(:clinic)
    end

    context "入力内容が空でないこと" do
      it "クリニックの登録ができること" do
        expect(@clinic).to be_valid
      end
    end

    context "バリデーションが有効であること" do

      it "nameがnilの場合は登録できないこと" do
        @clinic.name = " "
        expect(@clinic).to be_invalid
      end

      it "doctorがnilの場合は登録できないこと" do
        @clinic.doctor = " "
        expect(@clinic).to be_invalid
      end

      it "addressがnilの場合は登録できないこと" do
        @clinic.address = " "
        expect(@clinic).to be_invalid
      end

      it "phone_numberがnilの場合は登録できないこと" do
        @clinic.phone_number = " "
        expect(@clinic).to be_invalid
      end

      it "postcodeがnilの場合は登録できないこと" do
        @clinic.postcode = " "
        expect(@clinic).to be_invalid
      end

      it "is_activeがtrueもしくはfalse以外では登録できないこと" do
        @clinic.is_active = nil
        expect(@clinic).to be_invalid
      end
      
    end

  end

  describe "モデルの関連付け" do

    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "GenreMapモデルとのアソシエーションが1:Nとなっていること" do
      let(:target) { :genre_maps }
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "GenreMap" } 
    end

    context "Genreモデルとのアソシエーションが1:Nとなっていること" do
      let(:target) { :genres }
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Genre" } 
    end

    context "ConsultationHourモデルとのアソシエーションが1:Nとなっていること" do
      let(:target) { :consultation_hours }
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "ConsultationHour" } 
    end

    context "Reviewモデルとのアソシエーションが1:Nとなっていること" do
      let(:target) { :reviews }
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Review" } 
    end

    context "Memberモデルとのアソシエーションが1:Nとなっていること" do
      let(:target) { :members }
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Member" } 
    end

    context "Favoriteモデルとのアソシエーションが1:Nとなっていること" do
      let(:target) { :favorites }
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Favorite" } 
    end
    
    context "ClinicHistoryモデルとのアソシエーションが1:Nとなっていること" do
      let(:target) { :clinic_histories }
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "ClinicHistory" } 
    end
    
  end
  
  describe "あいまい検索メソッドの確認" do

    clinic1 = Clinic.create(
      name: "大阪クリニック",
      nearest_station: "京橋駅",
      phone_number: "0776669999",
      address: "大阪府大阪市中央区123",
      doctor: "a",
      postcode: "1111111",
      is_active: "true",
    )

    clinic2 = Clinic.create(
      name: "東京クリニック",
      nearest_station: "西京橋駅",
      phone_number: "1122556755",
      address: "東京都千代田区丸の内123",
      doctor: "a",
      postcode: "1111111",
      is_active: "true",
    )

    clinic3 = Clinic.create(
      name: "福岡医院",
      nearest_station: "博多駅",
      phone_number: "1234555567",
      address: "福岡県福岡市中央区博多123",
      doctor: "a",
      postcode: "1111111",
      is_active: "true",
    )

    context "一致するデータが見つかるとき" do
      it "検索文字列に部分一致するクリニックを返すこと" do
        expect(Clinic.search("クリニック")).to include(clinic1, clinic2)
        expect(Clinic.search("クリニック")).to_not include(clinic3)
  
        expect(Clinic.search("京橋")).to include(clinic1, clinic2)
        expect(Clinic.search("京橋")).to_not include(clinic3)
  
        expect(Clinic.search("5567")).to include(clinic2, clinic3)
        expect(Clinic.search("5567")).to_not include(clinic1)
  
        expect(Clinic.search("中央区")).to include(clinic1, clinic3)
        expect(Clinic.search("中央区")).to_not include(clinic2)
      end
    end
    
    context "一致するデータが見つからないとき" do
      it "検索結果が1件も見つからなければ空のコレクションを返すこと" do
        expect(Clinic.search("びょういん")).to be_empty
        expect(Clinic.search("名古屋")).to be_empty
        expect(Clinic.search("3333")).to be_empty
        expect(Clinic.search("京都府京都市")).to be_empty
      end
    end
    
  end

end