class Clinic < ApplicationRecord

  has_many :consultation_hours, dependent: :destroy
  accepts_nested_attributes_for :consultation_hours

  mount_uploaders :images, ImageUploader
  attachment :image

end
