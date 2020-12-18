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
    # @review.member_id = current_member.id
    # @review.score = params[:score]
    # @review.save
    @review.review_create #実装途中
    Coupon.coupon_create(current_member)
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
