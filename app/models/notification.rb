class Notification < ApplicationRecord
  default_scope->{order(created_at: :desc)}

  belongs_to :visiter, class_name: "Member", foreign_key: "visiter_id", optional: true
  belongs_to :visited, class_name: "Member", foreign_key: "visited_id", optional: true

  belongs_to :room, optional: true
  belongs_to :message, optional: true

  def self.update_attributes!(notifications)
    notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
  
end
