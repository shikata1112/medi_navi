class Member::InquiryController < ApplicationController
  before_action :authenticate_member!

  def new
    @inquiry = current_member.inquiries.new
  end

  def confirm
    @inquiry = current_member.inquiries.new(inquiry_params)

    render :new if @inquiry.invalid?
  end

  def create
    @inquiry = current_member.inquiries.new(inquiry_params)
    @inquiry.save!
    redirect_to action: :thanks
  end

  def thanks
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:content, :title, :member_id)
  end
end