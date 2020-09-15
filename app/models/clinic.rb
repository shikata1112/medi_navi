class Clinic < ApplicationRecord

  has_many :genre_maps
  has_many :genres, through: :genre_maps

  has_many :consultation_hours, dependent: :destroy
  accepts_nested_attributes_for :consultation_hours

  has_many :favorites, dependent: :destroy
  has_many :members, through: :favorites

  has_many :reviews, dependent: :destroy
  has_many :members, through: :reviews

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end

  attr_accessor :genre_ids

  mount_uploaders :images, ImageUploader
  attachment :image

  # def genre_ids
  #   genre_maps.pluck(:genre_id)
  # end

end
