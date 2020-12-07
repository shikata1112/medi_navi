require 'rails_helper'

RSpec.describe ClinicHistory, type: :model do

  describe "モデルの関連付け" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Memberモデルとのアソシエーション" do
      let(:target) { :member } 
      it { expect(association.macro).to eq :belongs_to } 
      it { expect(association.class_name).to eq "Member" } 
    end

    context "Clinicモデルとのアソシエーション" do
      let(:target) { :clinic } 
      it { expect(association.macro).to eq :belongs_to } 
      it { expect(association.class_name).to eq "Clinic" } 
    end
end

  describe "メソッドの動作テスト" do
    before do
      @clinic1 = build(:clinic)
      @clinic2 = build(:clinic)
      @clinic3 = build(:clinic)
      @clinic4 = build(:clinic)
      @member1 = build(:member)
    end

    it "create_new_historyメソッドが正常に動作すること" do
      ClinicHistory.create_new_history(@member1, @clinic1)
      ClinicHistory.create_new_history(@member1, @clinic2)
      ClinicHistory.create_new_history(@member1, @clinic1)

      expect(2).to eq ClinicHistory.all.size
    end

    it "destroy_old_historyメソッドが正常に動作すること" do
      ClinicHistory.create_new_history(@member1, @clinic1)
      ClinicHistory.create_new_history(@member1, @clinic2)
      ClinicHistory.create_new_history(@member1, @clinic3)
      ClinicHistory.create_new_history(@member1, @clinic4)

      ClinicHistory.destroy_old_history(@member1)

      expect(3).to eq ClinicHistory.all.size
    end
    
  end
end