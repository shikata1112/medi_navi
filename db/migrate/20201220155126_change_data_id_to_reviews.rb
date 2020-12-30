class ChangeDataIdToReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :member_id, :integer
    change_column :reviews, :clinic_id, :integer
  end
end
