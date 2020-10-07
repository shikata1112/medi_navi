class Member::MembersController < ApplicationController
  before_action :authenticate_member!
  
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

  def resignation
    @member = Member.find(current_member.id)
  end

  def quit
    @member = Member.find(current_member.id)
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "◆退会処理が完了しました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def follows
    member = Member.find(params[:id])
    @members = member.followings
  end

  def followers
    member = Member.find(params[:id])
    @members = member.followers
  end

  private

  def member_params
    params.require(:member).permit(:name, :profile_image, :address, :email, :birthday, :postcode, :sex)
  end

end
