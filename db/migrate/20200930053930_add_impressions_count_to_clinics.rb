class AddImpressionsCountToClinics < ActiveRecord::Migration[5.2]
  def change
    add_column :clinics, :impressions_count, :integer, default: 0
  end
end
