require 'rails_helper'

RSpec.describe Notification, type: :model do

  describe "モデルの関連付け" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Roomモデルとのアソシエーション" do
      let(:target) { :room } 
      it { expect(association.macro).to eq :belongs_to } 
      it { expect(association.class_name).to eq "Room" } 
    end

    context "Messageモデルとのアソシエーション" do
      let(:target) { :message } 
      it { expect(association.macro).to eq :belongs_to } 
      it { expect(association.class_name).to eq "Message" } 
    end
  end

  describe "#checked_true_or_false" do
    it "visiterとvisitedが等しかったらtrue, 等しくなかったらfalse" do
      notification1 = build(:notification1, visiter_id: 1, visited_id: 2)
      notification2 = build(:notification2, visiter_id: 3, visited_id: 3)

      expect(false).to eq notification1.checked_true_or_false
      expect(true).to eq notification2.checked_true_or_false  
    end
  end
end