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

  describe ".create_new_history" do
    before do
      @clinic1 = create(:clinic)
      @clinic2 = create(:clinic)
      @member1 = create(:member)
    end

    it "クリニックの閲覧履歴が保存されること" do
      @clinic1.clinic_histories.create_new_history(@member1, @clinic1.id)
      @member1.reload
      @clinic2.clinic_histories.create_new_history(@member1, @clinic2.id)
      @member1.reload
      @clinic1.clinic_histories.create_new_history(@member1, @clinic1.id)
      @member1.reload
      expect(2).to eq ClinicHistory.all.size
    end
  end

  describe ".destroy_old_history" do
    before do
      @clinic1 = create(:clinic)
      @clinic2 = create(:clinic)
      @clinic3 = create(:clinic)
      @clinic4 = create(:clinic)
      @member1 = create(:member)
    end

    it "クリニックの古い閲覧履歴が削除されること" do
      @clinic1.clinic_histories.create_new_history(@member1, @clinic1)
      @clinic2.clinic_histories.create_new_history(@member1, @clinic2)
      @clinic3.clinic_histories.create_new_history(@member1, @clinic3)
      @clinic4.clinic_histories.create_new_history(@member1, @clinic4)
  
      ClinicHistory.destroy_old_history(@member1)
  
      expect(3).to eq ClinicHistory.all.size
    end
  end

  describe "delegations" do
    it { is_expected.to delegate_method(:name).to(:clinic).with_prefix }
    it { is_expected.to delegate_method(:address).to(:clinic).with_prefix }
  end

  describe "#clinic_reviews_score" do
    before do
      clinic = create(:clinic)
      member = create(:member)
      review1 = create(:review, clinic_id: clinic.id, member_id: member.id, score: 3.0)
      refiew2 = create(:review2, clinic_id: clinic.id, member_id: member.id, score: 5.0)
      @history = create(:clinic_history, clinic_id: clinic.id, member_id: member.id)
    end
    
    it "clinicに紐づいたreviewsのscoreを配列で返すこと" do
      expect(@history.clinic_reviews_score).to eq [3.0, 5.0]
    end
  end
end