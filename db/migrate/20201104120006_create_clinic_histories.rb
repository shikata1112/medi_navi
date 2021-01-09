class CreateClinicHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :clinic_histories do |t|

      t.timestamps
    end
  end
end
