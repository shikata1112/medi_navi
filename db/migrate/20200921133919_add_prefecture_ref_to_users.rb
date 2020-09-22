class AddPrefectureRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :clinics, :prefecture, foreign_key: true
  end
end
