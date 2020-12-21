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

  describe "#review_save!" do
    before do
      @clinic = create(:clinic1)
      @member = create(:member)
      @review = build(:review)
    end

    it 'レビューを保存できること' do
      score = 3
      review = @clinic.reviews.build
      review.review_save!(@review, @member, score)

      expect(@review).to be_valid
      expect(1).to eq @clinic.reviews.size
      expect(1).to eq @clinic.reviews.first.clinic_id
    end
  end

end