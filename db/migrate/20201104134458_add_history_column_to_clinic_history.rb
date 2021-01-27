class AddHistoryColumnToClinicHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :clinic_histories, :member_id, :integer, :index => true
    add_column :clinic_histories, :clinic_id, :integer, :index => true
  end
end
