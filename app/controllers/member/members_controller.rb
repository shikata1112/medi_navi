class Member::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_member_path(@member)
  end

  private

  def member_params
    params.require(:member).permit(:name, :profile_image, :address, :email, :birthday, :postcode, :sex)
  end

end
