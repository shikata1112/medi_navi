require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  before do
    member = build(:member)
    @inquiry = build(:inquiry, member_id: member.id)
  end

  it "問い合わせの登録ができること" do
    expect(@inquiry).to be_valid
  end

  it "titleが空の場合は登録できないこと" do
    @inquiry.title = " "
    expect(@inquiry).to be_invalid
  end

  it "contentが空の場合は登録できないこと" do
    @inquiry.content = " "
    expect(@inquiry).to be_invalid
  end
end
