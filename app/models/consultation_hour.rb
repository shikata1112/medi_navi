class ConsultationHour < ApplicationRecord
  belongs_to :clinic, optional: true

  enum mo_time: [:◯, :／, :△], _prefix: true
  enum tu_time: [:◯, :／, :△], _prefix: true
  enum we_time: [:◯, :／, :△], _prefix: true
  enum th_time: [:◯, :／, :△], _prefix: true
  enum fr_time: [:◯, :／, :△], _prefix: true
  enum sa_time: [:◯, :／, :△], _prefix: true
  enum su_time: [:◯, :／, :△], _prefix: true
  enum ho_time: [:◯, :／, :△], _prefix: true
end
