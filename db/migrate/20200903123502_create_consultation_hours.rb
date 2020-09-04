class CreateConsultationHours < ActiveRecord::Migration[5.2]
  def change
    create_table :consultation_hours do |t|
      t.integer :clinic_id, index: true
      t.string :week_time
      t.string :mo_time
      t.string :tu_time
      t.string :we_time
      t.string :th_time
      t.string :fr_time
      t.string :sa_time
      t.string :su_time
      t.string :ho_time

      t.timestamps
    end
  end
end
