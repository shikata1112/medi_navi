require 'rails_helper'

RSpec.describe Room, type: :model do

  describe "モデルの関連付け" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Entryモデルとのアソシエーション" do
      let(:target) { :entries } 
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Entry" } 
    end

    context "Messageモデルとのアソシエーション" do
      let(:target) { :messages } 
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Message" } 
    end

    context "Notificationモデルとのアソシエーション" do
      let(:target) { :notifications } 
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Notification" } 
    end
  end

end