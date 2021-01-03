require 'rails_helper'

RSpec.describe Coupon, type: :model do

  describe "モデルの関連付け" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Memberモデルとのアソシエーション" do
      let(:target) { :member } 
      it { expect(association.macro).to eq :belongs_to } 
      it { expect(association.class_name).to eq "Member" } 
    end
  end

  describe "#ja_expiration_date" do
    before do
      @member = create(:member)
      @coupon = create(:coupon, member_id: @member.id)
    end

    it "有効期限を返すこと" do
      expect(@coupon.ja_expiration_date).to eq (Time.now + 1.minute).to_s(:datetime_jp)
    end
  end
end