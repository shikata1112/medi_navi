class Favorite < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :clinic, optional: true

  validates_uniqueness_of :clinic_id, scope: :member_id
end
