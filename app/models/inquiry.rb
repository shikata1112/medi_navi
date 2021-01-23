class Inquiry < ApplicationRecord
  belongs_to :member

  validates :content, :title, presence: true
end
