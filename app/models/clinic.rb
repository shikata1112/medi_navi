class Clinic < ApplicationRecord

  # 診療科目登録機能
  has_many :genre_maps
  has_many :genres, through: :genre_maps

  attr_accessor :genre_ids

  # 診療時間登録機能
  has_many :consultation_hours, dependent: :destroy
  accepts_nested_attributes_for :consultation_hours

  # いいね機能
  has_many :favorites, dependent: :destroy
  has_many :members, through: :favorites

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end

  # レビュー機能
  has_many :reviews, dependent: :destroy
  has_many :members, through: :reviews

  # 画像投稿機能
  mount_uploaders :images, ImageUploader
  attachment :image

  # 検索機能
  def Clinic.search(search)
    Clinic.where(['name LIKE ? OR nearest_station LIKE ? OR phone_number LIKE ? OR address LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
  end

  
  # google API, 現在地からの検索機能
  geocoded_by :address
  after_validation :geocode

end
