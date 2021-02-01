class MemberMailer < ApplicationMailer

  def inquiry_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: "fl13a038@gmail.com",
      to:   "#{@inquiry.member.email}",
      subject: "【メディナビ】お問い合わせ完了のお知らせ。"
    )
  end
end