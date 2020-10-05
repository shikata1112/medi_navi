class Member::ReviewsController < ApplicationController
  before_action :authenticate_member!

  def new
    @clinic = Clinic.find(params[:clinic_id])
    @review = Review.new
  end

  def index
    @clinic = Clinic.find(params[:clinic_id])
    # @reviews = Review.eager_load(:members, :taggings, :tags).where(member_id: current_member.id)
    @reviews = @clinic.reviews.includes(:tags, :member)
    # @reviews = Review.eager_load(:member, :taggings, :tags).all
  end

  def create
    @clinic = Clinic.find(params[:clinic_id])
    @review = @clinic.reviews.build(review_params)
    @review.member_id = current_member.id 
    @review.score = params[:score]
    @review.save
    redirect_to member_clinic_reviews_path
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:comment, :title, :score, :wating_time, :clinic_id, :tag_list)
  end
end
