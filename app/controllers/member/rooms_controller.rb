class Member::RoomsController < ApplicationController

  def create 
    room = Room.create 
    current_entry = Entry.create(member_id: current_member.id, room_id: room.id)
    another_entry = Entry.create(member_id: params[:entry][:member_id], room_id: room.id)
    redirect_to member_room_path(room)
  end

  def index
    current_entries = current_member.entries.includes(:room)
    my_room_ids = []
    current_entries.each do |entry|
      my_room_ids << entry.room.id
    end
    @another_entries = Entry.eager_load(:member, :room).where(room_id: my_room_ids).where.not(member_id: current_member.id)
  end

  def show
    @member = Member.find(params[:member_id])
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages.includes(:member)
    @another_entry = @room.entries.find_by('member_id != ?', current_member.id)
  end

end
