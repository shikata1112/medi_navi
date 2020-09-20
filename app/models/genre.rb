class Genre < ApplicationRecord
  has_many :genre_maps
  has_many :clinics, through: :genre_maps
end
