class Clinic < ApplicationRecord

  has_many :genre_maps
  has_many :genres, through: :genre_maps
  has_many :consultation_hours, dependent: :destroy
  accepts_nested_attributes_for :consultation_hours

  attr_accessor :genre_ids

  mount_uploaders :images, ImageUploader
  attachment :image

end
