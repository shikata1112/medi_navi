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

  describe ".message_create!" do
    before do
      @member = create(:member)
      params = ActionController::Parameters.new(room_id: 1, body: 'test')
      @message = params.permit(:room_id, :body).to_h
    end
end