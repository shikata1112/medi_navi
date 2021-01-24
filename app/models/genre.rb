class Genre < ApplicationRecord
  has_many :genre_maps
  has_many :clinics, :through => :genre_maps

  validates :medical_department, :presence => true
  validates :medical_department, :uniqueness => true
end
