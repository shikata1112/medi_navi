require 'rails_helper'

RSpec.describe ConsultationHour, type: :model do

  describe "モデルの関連付け" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Clinicモデルとのアソシエーション" do
      let(:target) { :clinic } 
      it { expect(association.macro).to eq :belongs_to } 
      it { expect(association.class_name).to eq "Clinic" } 
    end
  end
  
  describe "enum" do
    it { is_expected.to define_enum_for(:mo_time)}
    it { is_expected.to define_enum_for(:tu_time)}
    it { is_expected.to define_enum_for(:we_time)}
    it { is_expected.to define_enum_for(:th_time)}
    it { is_expected.to define_enum_for(:fr_time)}
    it { is_expected.to define_enum_for(:sa_time)}
    it { is_expected.to define_enum_for(:su_time)}
    it { is_expected.to define_enum_for(:ho_time)}
  end
end