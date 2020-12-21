class Notification < ApplicationRecord

  default_scope->{order(created_at: :desc)} # 新着順

  belongs_to :visiter, class_name: "Member", foreign_key: "visiter_id", optional: true
  belongs_to :visited, class_name: "Member", foreign_key: "visited_id", optional: true

  belongs_to :room, optional: true
  belongs_to :message, optional: true

  def self.notification_create!(current_member, room, message, entry)
    notification = current_member.active_notifications.new(
      room_id: room.id,
      message_id: message.id,
      visited_id: entry.member_id,
      visiter_id: current_member.id,
      action: 'dm'
    )
    notification.checked = true if notification.visiter_id == notification.visited_id
    notification.save! if notification.valid?
  end

end
