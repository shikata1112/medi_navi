class Admin::InquiryController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show]

  def index
    @inquiries = Inquiry.all
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end
end
