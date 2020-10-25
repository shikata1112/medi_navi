class Impressions < ActiveRecord::Migration[5.2]
  def change
    drop_table :impressions
  end
end
