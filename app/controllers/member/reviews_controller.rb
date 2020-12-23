class Member::ReviewsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_clinic, only: [:new, :index, :create]

  def new
    @review = Review.new
  end

  def index
    @reviews = @clinic.reviews.includes(:tags, :member)
  end

  def create
    @review = @clinic.reviews.build(review_params)
    @review.save!(@review, current_member, params[:score])
    current_member.coupon_create!
    redirect_to member_clinic_reviews_path
  rescue => e
    render 'new'
  end
  
  private

  def review_params
    params.require(:review).permit(:comment, :title, :score, :wating_time, :clinic_id, :tag_list)
  end

  def set_clinic
    @clinic = Clinic.find(params[:clinic_id])
  end

end
