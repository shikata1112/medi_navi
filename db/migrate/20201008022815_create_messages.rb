class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :member, foreign_key: true
      t.references :room, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
