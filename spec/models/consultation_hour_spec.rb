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
  
  describe "#time_status" do
    before do
      clinic = create(:clinic)
      ConsultationHour.create!(clinic_id: clinic.id, mo_time: 0, tu_time: 1, we_time: 2)
      @consultation_hour = ConsultationHour.first
    end
    
    it "条件に該当する文字列'◯'を返すこと" do
      expect(@consultation_hour.time_status(@consultation_hour.mo_time)).to eq '◯'
    end

    it "条件に該当する文字列'／'を返すこと" do
      expect(@consultation_hour.time_status(@consultation_hour.tu_time)).to eq '／'
    end

    it "条件に該当する文字列'△'を返すこと" do
      expect(@consultation_hour.time_status(@consultation_hour.we_time)).to eq '△'
    end
  end
end