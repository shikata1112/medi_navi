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

  describe ".notification_create!" do
    before do
      @current_member = create(:member)
      @member = create(:guest)
      @room = create(:room)
      @entry = create(:entry, member_id: @member.id)
    end

    it "メッセージの通知が保存されること" do
      @message = Message.create!(member_id: @current_member.id, room_id: @room.id, body: 'test')
      @entry = Entry.where.not(member_id: @current_member.id)
                    .find_by(room_id: @room.id)
      @current_member.active_notifications.notification_create!(@current_member, @room, @message, @entry)

      expect(1).to eq @current_member.active_notifications.size
      expect(1).to eq Notification.first.visiter_id
      expect(2).to eq Notification.first.visited_id
      expect('dm').to eq Notification.first.action  
    end
  end
  
end