class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :clinic

  validates_uniqueness_of :clinic_id, scope: :member_id
end
