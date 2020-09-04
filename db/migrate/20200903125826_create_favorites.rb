class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :member_id
      t.string :clinic_id

      t.timestamps
    end
  end
end
