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

end