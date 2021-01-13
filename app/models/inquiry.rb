class Inquiry < ApplicationRecord
  belongs_to :member

  validates :content, :member_id, presence: true
end
