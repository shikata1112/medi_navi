require 'rails_helper'

RSpec.describe ConsultationHour, type: :model do

  describe "モデルの関連付け" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Clinicモデルとのアソシエーション" do
      let(:target) { :clinic } 
      it { expect(association.macro).to eq :belongs_to } 
      it { expect(association.class_name).to eq "Clinic" } 
    end
  end

end