class AddExplanationToClinics < ActiveRecord::Migration[5.2]
  def change
    add_column :clinics, :explanation, :text
  end
end
