class CreateClinics < ActiveRecord::Migration[5.2]
  def change
    create_table :clinics do |t|
      t.string :name, index: true
      t.string :doctor
      t.string :address
      t.string :phone_number
      t.string :image_id
      t.text :official_site
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
