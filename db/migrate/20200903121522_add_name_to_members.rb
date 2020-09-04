class AddNameToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :name, :string
    add_column :members, :postcode, :string
    add_column :members, :address, :string
    add_column :members, :birthday, :date
    add_column :members, :sex, :boolean
    add_column :members, :is_deleted, :boolean, default: false
  end
end
