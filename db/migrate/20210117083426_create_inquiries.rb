class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :title, null: false, comment: '問い合わせの題名'
      t.text :content, null: false, comment: '問い合わせの本文'
      t.references :member, null: false

      t.timestamps
    end
  end
end
