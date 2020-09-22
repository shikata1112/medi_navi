class RemovePrefectureFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :prefecture, :reference
  end
end
