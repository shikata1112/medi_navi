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
    redirect_to thanks_member_inquiry_index_path
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error e.message
    flash[:danger] = "エラーが発生しました!もう1度やり直してください。"
    render :new
  end

  def thanks
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:content, :title)
  end
end