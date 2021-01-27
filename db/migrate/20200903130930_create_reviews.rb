class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :member_id
      t.string :clinic_id
      t.string :title
      t.text :comment
      t.integer :wating_time, :default => 0
      t.integer :score

      t.timestamps
    end
  end
end
