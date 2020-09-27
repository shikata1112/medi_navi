class Review < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :clinic, optional: true

  # タグ付け機能
  acts_as_taggable
  
end
