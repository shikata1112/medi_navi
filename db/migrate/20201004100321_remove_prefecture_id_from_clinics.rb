class RemovePrefectureIdFromClinics < ActiveRecord::Migration[5.2]
  def change
    remove_column :clinics, :prefecture_id, :integer
  end
end
