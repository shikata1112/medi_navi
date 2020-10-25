class AddClinicIdToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :clinic_id, :integer
    add_column :impressions, :member_id, :integer
  end
end
