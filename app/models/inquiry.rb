class Inquiry < ApplicationRecord
  belongs_to :member

  validates :content, presence: true
end
