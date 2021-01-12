class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.references :member, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
