class Review < ApplicationRecord
  belongs_to :member
  belongs_to :clinic

  delegate :name, :to => :member, :prefix => true

  # タグ付け機能
  acts_as_taggable

  validates :title, :comment, :wating_time, :score, :presence => true
end
