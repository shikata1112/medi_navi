class Member::InquiryController < ApplicationController
  before_action :authenticate_member!, only: [:new, :confirm, :create, :thanks]
  
  def new
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    render :new if @inquiry.invalid?
  end

  def create
    @inquiry = current_member.inquiries.create!(inquiry_params)
    redirect_to action: :thanks
  end

  def thanks
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:content, :title)
  end
end