class CreateGenreMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_maps do |t|
      t.integer :clinic_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
