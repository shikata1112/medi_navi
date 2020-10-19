class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :medical_department, index: true

      t.timestamps
    end
  end
end
