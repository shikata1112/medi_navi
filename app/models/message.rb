class Message < ApplicationRecord
  belongs_to :member
  belongs_to :room

  delegate :name, :to => :member, :prefix => true

  validates :body, :presence => true
end
