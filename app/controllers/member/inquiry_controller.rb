class Member::InquiryController < ApplicationController
  before_action :authenticate_member!, only: [:new, :confirm, :create, :thanks]
  
  def new
    @inquiry = Inquiry.new
  end

  def create
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.member_id = current_member.id

    render :new if @inquiry.invalid?
  end

  def thanks
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:content, :title, :member_id)
  end
end
