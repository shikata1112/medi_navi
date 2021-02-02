class ConsultationHour < ApplicationRecord
  belongs_to :clinic, optional: true

  def time_status(time)
    if time == 0
      '◯'
    elsif time == 1
      '／'
    else
      '△'
    end
  end
end
