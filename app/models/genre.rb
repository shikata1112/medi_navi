class Genre < ApplicationRecord

  has_many :clinics, through: :genre_maps
  has_many :genre_maps

end
