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

  before do
    @clinic1 = create(:clinic)
    @clinic2 = create(:clinic)
    @clinic3 = create(:clinic)
    @clinic4 = create(:clinic)
    @member1 = create(:member)
  end

  it "#create_new_history" do
    @clinic1.clinic_histories.create_new_history(@member1, @clinic1)
    @clinic2.clinic_histories.create_new_history(@member1, @clinic2)
    @clinic1.clinic_histories.create_new_history(@member1, @clinic1)
    expect(2).to eq ClinicHistory.all.size
  end

  it "#destroy_old_history" do
    @clinic1.clinic_histories.create_new_history(@member1, @clinic1)
    @clinic2.clinic_histories.create_new_history(@member1, @clinic2)
    @clinic3.clinic_histories.create_new_history(@member1, @clinic3)
    @clinic4.clinic_histories.create_new_history(@member1, @clinic4)

    ClinicHistory.destroy_old_history(@member1)

    expect(3).to eq ClinicHistory.all.size
  end
end