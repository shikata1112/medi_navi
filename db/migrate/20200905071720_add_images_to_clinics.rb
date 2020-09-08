class AddImagesToClinics < ActiveRecord::Migration[5.2]
  def change
    add_column :clinics, :images, :json
  end
end
