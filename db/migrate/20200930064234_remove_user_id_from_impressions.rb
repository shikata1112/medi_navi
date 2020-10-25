class RemoveUserIdFromImpressions < ActiveRecord::Migration[5.2]
  def change
    remove_column :impressions, :user_id, :integer
  end
end
