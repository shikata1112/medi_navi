class Inquiry < ApplicationRecord
  belongs_to :member

  delegate :name, :email, to: :member, prefix: true

  validates :content, :title, presence: true
end
