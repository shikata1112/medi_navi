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

  describe "#arrived" do
    it "visiterとvisitedが等しかったらtrue, 等しくなかったらfalse" do
      notification1 = build(:notification1, visiter_id: 1, visited_id: 2)
      notification2 = build(:notification2, visiter_id: 3, visited_id: 3)

      expect(false).to eq notification1.arrived
      expect(true).to eq notification2.arrived
    end
  end
  
  describe ".update_checked" do
    before do
      @member1 = create(:member)
    end

    it "checkedが全てtrueに更新されること" do
      3.times do |i|
        Notification.create!(
          visited_id: @member1.id,
          visiter_id: "#{i + 1}".to_i,
          checked: false
        )
      end

      notifications = @member1.passive_notifications
      notifications.update_checked

      expect(3).to eq @member1.passive_notifications.where(checked: true).size
      expect(0).to eq @member1.passive_notifications.where(checked: false).size
    end
  end
end