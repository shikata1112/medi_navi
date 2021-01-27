class RemoveScoreFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :score, :integer
    add_column :reviews, :score, :float, :default => 0
  end
end
