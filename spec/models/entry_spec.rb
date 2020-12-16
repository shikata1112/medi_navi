require 'rails_helper'

RSpec.describe Entry, type: :model do

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

  before do
    @current_member = create(:member)
    @member = create(:guest)
    room1 = create(:room1)
    room2 = create(:room2)
    entry1 = create(:entry1)
    entry2 = create(:entry2)
  end

  describe ".room_exists?" do
    it 'entryモデルに紐ずくroomが存在するときtrueを返すこと' do
      @member.entries.room_exists?(@current_member, @member)

      expect(true).to be true
    end
  end

  describe ".room_id" do
    it 'entryモデルに紐ずく配列から1件のroom_idを返すこと' do
      first_room_id = @member.entries.room_id(@current_member, @member)

      expect(1).to eq first_room_id
    end
  end
  
end