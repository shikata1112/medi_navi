class AddImpressionsCountToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :impressions_count, :integer, default: 0
  end
end
