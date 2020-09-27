class ConsultationHour < ApplicationRecord
  belongs_to :clinic, optional: true

  enum mo_time: { '●': 0, '／': 1, '▲': 2}, _prefix: true
  enum tu_time: { '●': 0, '／': 1, '▲': 2}, _prefix: true
  enum we_time: { '●': 0, '／': 1, '▲': 2}, _prefix: true
  enum th_time: { '●': 0, '／': 1, '▲': 2}, _prefix: true
  enum fr_time: { '●': 0, '／': 1, '▲': 2}, _prefix: true
  enum sa_time: { '●': 0, '／': 1, '▲': 2}, _prefix: true
  enum su_time: { '●': 0, '／': 1, '▲': 2}, _prefix: true
  enum ho_time: { '●': 0, '／': 1, '▲': 2}, _prefix: true
end
