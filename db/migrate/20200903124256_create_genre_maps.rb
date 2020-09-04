class CreateGenreMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_maps do |t|
      t.string :clinic_id
      t.string :genre_id

      t.timestamps
    end
  end
end
