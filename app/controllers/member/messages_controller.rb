class Member::MessagesController < ApplicationController

  def create 
    @message = Message.new(message_params)
    @message.member_id = current_member.id 
    @room = @message.room
    if @message.save

      # DMの通知
      @roommembernotme = Entry.where(room_id: @room.id).where.not(member_id: current_member.id)
      @theid = @roommembernotme.find_by(room_id: @room.id)
      notification = current_member.active_notifications.new(
          room_id: @room.id,
          message_id: @message.id,
          visited_id: @theid.member_id,
          visiter_id: current_member.id,
          action: 'dm'
      )
      # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.visiter_id == notification.visited_id
          notification.checked = true
      end
      notification.save if notification.valid?
        
      # redirect_to member_room_path(@room)
      redirect_back(fallback_location: root_path)
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
