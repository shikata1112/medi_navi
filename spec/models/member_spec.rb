require 'rails_helper'

RSpec.describe Member, type: :model do

  describe "会員登録" do
    it "会員情報が正しく登録できること" do
      member = build(:member)
      expect(member).to be_valid
    end 
  end

end
