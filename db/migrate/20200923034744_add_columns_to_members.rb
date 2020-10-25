class AddColumnsToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :latitude, :float
    add_column :members, :longitude, :float
  end
end
