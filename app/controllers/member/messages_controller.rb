class Member::MessagesController < ApplicationController

  def create 
    message = Message.new(message_params)
    message.member_id = current_member.id 
    if message.save 
      redirect_to member_room_path(message.room)
    else 
      redirect_back(fallback_location: root_path)
    end
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
