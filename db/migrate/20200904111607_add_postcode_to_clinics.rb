class AddPostcodeToClinics < ActiveRecord::Migration[5.2]
  def change
    add_column :clinics, :postcode, :string
  end
end
