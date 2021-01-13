class Admin::InquiryController < ApplicationController
  before_action :authenticate_admin!

  def index
    @inquiries = Inquiry.all
  end

end