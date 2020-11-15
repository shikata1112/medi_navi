class Member::MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :set_member, only: [:show, :edit, :update, :follows, :followers]
  
  def show
    @current_entry = Entry.where(member_id: current_member.id)
    @another_entry = Entry.where(member_id: @member.id)
    unless @member.id == current_member.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to member_member_path(current_member.id)
      flash[:notice_update] = "会員情報が更新されました。"
    else
      flash[:alert_update] = "正しい値を入力してください。"
      redirect_back(fallback_location: root_path)
    end
  end

  def resignation
    @member = Member.find(current_member.id)
  end

  def quit
    @member = Member.find(current_member.id)
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "◆退会処理が完了しました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def follows
    @members = @member.followings
  end

  def followers
    @members = @member.followers
  end

  private

  def member_params
    params.require(:member).permit(:name, :profile_image, :address, :email, :birthday, :postcode, :sex)
  end

  def set_member
    @member = Member.find(params[:id])
  end

end
