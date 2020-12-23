class Message < ApplicationRecord
  belongs_to :member
  belongs_to :room

  validates :body, presence: true
end
