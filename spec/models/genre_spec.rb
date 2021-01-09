require 'rails_helper'

RSpec.describe Genre, type: :model do

  describe "モデルの関連付け" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "GenreMapモデルとのアソシエーション" do
      let(:target) { :genre_maps } 
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "GenreMap" } 
    end

    context "Clinicモデルとのアソシエーション" do
      let(:target) { :clinics } 
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Clinic" } 
    end
  end

end