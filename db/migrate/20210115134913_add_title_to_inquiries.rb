class AddTitleToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :title, :string
  end
end
