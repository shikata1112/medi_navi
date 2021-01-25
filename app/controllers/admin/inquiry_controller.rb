class Admin::InquiryController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show]

  def index
    @inquiries = Inquiry.eager_load(:member).all
  end

  def show
  end
end
