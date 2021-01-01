require 'rails_helper'

RSpec.describe Message, type: :model do

  describe "モデルの関連付け" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Memberモデルとのアソシエーション" do
      let(:target) { :member } 
      it { expect(association.macro).to eq :belongs_to } 
      it { expect(association.class_name).to eq "Member" } 
    end

    context "Roomモデルとのアソシエーション" do
      let(:target) { :room } 
      it { expect(association.macro).to eq :belongs_to } 
      it { expect(association.class_name).to eq "Room" } 
    end
  end

  describe "delegations" do
    before do
      @member = create(:member, name: 'やまだ')
      @room = create(:room1)
    end

    it "#member_name" do
      message = Message.create!(member_id: @member.id, room_id: @room.id, body: 'test')

      expect(message.member_name).to eq 'やまだ'  
    end
  end
end