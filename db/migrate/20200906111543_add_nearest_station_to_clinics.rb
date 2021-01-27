class AddNearestStationToClinics < ActiveRecord::Migration[5.2]
  def change
    add_column :clinics, :nearest_station, :string, :index => true
  end
end
