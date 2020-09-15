class Member::ReviewsController < ApplicationController
  def new
    @clinic = Clinic.find(params[:clinic_id])
    @review = Review.new
  end

  def index
    @clinic = Clinic.find(params[:clinic_id])
    @reviews = Review.where(member_id: current_member.id)
  end

  def create
    @clinic = Clinic.find(params[:clinic_id])
    @review = @clinic.reviews.build(review_params)
    @review.member_id = current_member.id 
    @review.save
    redirect_to member_clinic_reviews_path
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:comment, :title, :score, :wating_time, :clinic_id)
  end
end
