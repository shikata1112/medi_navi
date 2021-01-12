class Member::InquiryController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render :confirm
    else
      render :new
    end
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.save!
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:content, :member_id)
  end
end
