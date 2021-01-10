class Clinic < ApplicationRecord

  has_many :genre_maps
  has_many :genres, through: :genre_maps
  attr_accessor :genre_ids

  has_many :consultation_hours, dependent: :destroy
  accepts_nested_attributes_for :consultation_hours

  has_many :reviews, dependent: :destroy
  has_many :members, through: :reviews

  has_many :favorites, dependent: :destroy
  has_many :members, through: :favorites

  has_many :clinic_histories, dependent: :destroy

  # バリデーション
  validates :name, :doctor, :address, :postcode, :phone_number, presence: true
  validates :is_active, inclusion: {in: [true, false]}
  
  # クリニックのお気に入り機能
  def favorited_by?(member)
    favorites.any? {|favorite| favorite.member_id == member.id}
  end

  # 画像投稿機能
  mount_uploaders :images, ImageUploader
  attachment :image

  # google API, 現在地からの検索機能
  geocoded_by :address
  after_validation :geocode

  # impressions-pv
  is_impressionable counter_cache: true

  # 検索機能
  def self.search(search)
    where(['name LIKE ? OR nearest_station LIKE ? OR phone_number LIKE ? OR address LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
  end

  def self.new_order
    order(id: 'DESC')
  end

  def self.clinics_load
    eager_load(:genres, :favorites, :consultation_hours, :reviews, :genre_maps)
  end

  def display_active_text
    is_active ? '開院中' : '閉院中'
  end

  def review_scores
    reviews.pluck(:score)
  end
  
end
