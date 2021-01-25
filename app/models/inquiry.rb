class Inquiry < ApplicationRecord
  belongs_to :member

  delegate :name, to: :member, prefix: true

  validates :content, :title, presence: true
end
