class ConsultationHour < ApplicationRecord
  belongs_to :clinic, :optional => true
end
