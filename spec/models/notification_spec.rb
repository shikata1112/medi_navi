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

  describe ".update_attributes!" do
    before do
      @member1 = create(:member)
      @member2 = create(:guest)
    end

    it "checkedがtrueに更新されること" do
      Notification.create(
        visited_id: @member1.id,
        visiter_id: @member2.id,
        checked: false
      )

      notifications = @member1.passive_notifications
      notifications.update_attributes!(notifications)

      expect(true).to eq Notification.find(1).checked
    end
  end
end