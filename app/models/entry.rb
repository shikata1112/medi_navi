class Entry < ApplicationRecord
  belongs_to :member
  belongs_to :room

  def new_room_entry(member, current_member, current_entry, another_entry)

    unless member.id == current_member.id
      current_entry.each do |current|
        another_entry.each do |another|
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
end
