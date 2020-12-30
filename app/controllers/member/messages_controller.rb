class Member::MessagesController < ApplicationController
  before_action :authenticate_member!

  def create 
    @message = current_member.messages.create!(message_params)
    @room = @message.room
    @entry = Entry.where.not(member_id: current_member.id).find_by(room_id: @room.id)
    current_member.notification_create!(@room, @message, @entry)
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error e.full_messages
  rescue => e
    Rails.logger.error e.full_messages
    # TODO: 警告文を出す処理
  ensure
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
