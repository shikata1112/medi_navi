class Member::RoomsController < ApplicationController

  def create
    room = Room.create!
    Entry.create!(:member_id => current_member.id, :room_id => room.id)
    Entry.create!(:member_id => params[:entry][:member_id], :room_id => room.id)
    redirect_to member_room_path(room)
  end

  def index
    @another_entries = Entry.eager_load(:member, :room)
                            .where(:room_id => current_member.room_ids)
                            .where.not(:member_id => current_member.id)
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages.includes(:member)
    @entry = @room.entries.find_by('member_id != ?', current_member.id)
  end

end
