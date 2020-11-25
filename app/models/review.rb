class Review < ApplicationRecord
  belongs_to :member
  belongs_to :clinic

  # タグ付け機能
  acts_as_taggable

  validates :title, :comment, presence: true
  
end
