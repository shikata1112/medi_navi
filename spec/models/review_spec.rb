require 'rails_helper'

RSpec.describe Review, type: :model do

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

  describe "delegations" do
    before do
      @member = create(:member, name: 'しゅうへい')
      @clinic = create(:clinic)
    end

    it "#member_name" do
      review = create(:review, member_id: @member.id, clinic_id: @clinic.id)

      expect(review.member_name).to eq 'しゅうへい'  
    end
  end
end