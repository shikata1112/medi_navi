class Notification < ApplicationRecord
  belongs_to :visiter, class_name: "Member", foreign_key: "visiter_id", optional: true
  belongs_to :visited, class_name: "Member", foreign_key: "visited_id", optional: true

  belongs_to :room, optional: true
  belongs_to :message, optional: true

  def self.update_checked
    where(checked: false).update_all(checked: true)
  end
end
