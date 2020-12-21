class Member::MessagesController < ApplicationController
  before_action :authenticate_member!

  def create 
    @message = Message.message_create!(current_member, message_params)
    @room = @message.room
    @entry = Entry.where.not(member_id: current_member.id).find_by(room_id: @room.id)
    current_member.active_notifications.notification_create!(current_member, @room, @message, @entry)
    redirect_back(fallback_location: root_path)
  rescue => e
    redirect_back(fallback_location: root_path)
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :body)
  end

end
