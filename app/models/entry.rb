class Entry < ApplicationRecord
  belongs_to :member
  belongs_to :room

  delegate :name, to: :member, prefix: true

  def self.room_exists?(member, current_member)
    room_ids(member, current_member).present?
  end

  def self.room_id(member, current_member)
    room_ids(member, current_member).first
  end

  def self.room_ids(member, current_member)
    entry_room_ids = unscope(where: :member_id).where(member_id: [current_member.id, member.id])
                                               .where.not(room_id: nil)
                                               .pluck(:room_id)
    entry_room_ids.select { |i| entry_room_ids.count(i) > 1 }.uniq
  end

end
