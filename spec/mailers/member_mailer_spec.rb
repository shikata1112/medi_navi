require "rails_helper"

RSpec.describe MemberMailer, type: :mailer do
  before do
    member = create(:member, email: 'member@gmail.com')
    @inquiry = Inquiry.new(member_id: member.id, title: 'test', content: 'testですよ')
  end

  describe ".inquiry_mail" do
    subject(:mail) do
      MemberMailer.inquiry_mail(@inquiry).deliver_now
      ActionMailer::Base.deliveries.last
    end

    it { expect(mail.from.first).to eq('fl13a038@gmail.com') }
    it { expect(mail.to.first).to eq('member@gmail.com') }
    it { expect(mail.subject).to eq('【メディナビ】お問い合わせ完了のお知らせ。') }
  end
end