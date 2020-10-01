class AddUid < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :uid, :string
    add_column :members, :provider, :string
  end
end
