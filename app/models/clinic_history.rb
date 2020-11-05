class ClinicHistory < ApplicationRecord
  belongs_to :clinic
  belongs_to :member
end
