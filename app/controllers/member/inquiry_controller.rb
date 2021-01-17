class Member::InquiryController < ApplicationController
  before_action :authenticate_member!

  def new
    @inquiry = current_member.inquiries.new
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
    @inquiry = current_member.inquiries.new(inquiry_params)
    @inquiry.save!
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:content, :title, :member_id)
  end
end