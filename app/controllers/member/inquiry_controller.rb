class Member::InquiryController < ApplicationController
  before_action :authenticate_member!

  def new
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = current_member.inquiries.new(inquiry_params)

    if @inquiry.valid?
      render :confirm
    else
      render :new
    end
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.save!

    notifier = Slack::Notifier.new(ENV['WEBHOOK_URL'])
    notifier.ping('問い合わせ発生')
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:content, :member_id)
  end
end
