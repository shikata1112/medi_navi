# Preview all emails at http://localhost:3000/rails/mailers/member_mailer
class MemberMailerPreview < ActionMailer::Preview

  def inquiry_preview
    inquiry = Inquiry.first
    MemberMailer.inquiry_mail(inquiry)
  end
end
