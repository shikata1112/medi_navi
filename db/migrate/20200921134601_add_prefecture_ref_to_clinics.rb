class AddPrefectureRefToClinics < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :prefecture_id, :integer
  end
end
