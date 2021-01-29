class CreateConsultationHours < ActiveRecord::Migration[5.2]
  def change
    create_table :consultation_hours do |t|
      t.integer :clinic_id, index: true
      t.string :start_time
      t.string :finish_time
      t.integer :mo_time
      t.integer :tu_time
      t.integer :we_time
      t.integer :th_time
      t.integer :fr_time
      t.integer :sa_time
      t.integer :su_time
      t.integer :ho_time

      t.timestamps
    end
  end
end
