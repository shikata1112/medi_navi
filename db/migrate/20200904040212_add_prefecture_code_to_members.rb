class AddPrefectureCodeToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :prefecture_code, :integer
  end
end
