class AddNotificationColumnsToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :room_id, :integer
    add_column :notifications, :message_id, :integer
  end
end
