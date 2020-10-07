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

  def favorited_by?(member)
    # favorites.where(member_id: member.id).exists?
    # any?を使用することでSQL発行しない
    favorites.any? {|favorite| favorite.member_id == member.id}
  end

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

  # impressions-pv
  is_impressionable counter_cache: true


  # 新着順
  def self.new_order
    order(id: 'DESC')
  end

  # 星点数順
  def self.score_order
    Clinic.where(id: Review.group(:clinic_id).order('avg(score) desc').pluck(:clinic_id))
    # joins(:reviews).merge(Review.order('avg(score) desc'))
  end

  # レビュー数
  def self.review_order
    Clinic.where(id: Review.group(:clinic_id).order('count(clinic_id) desc').pluck(:clinic_id))
  end

  # 並び替え
  def self.sort(selection)
    case selection 
    when "new"
      new_order
    when "score"
      score_order
    when "review"
      review_order
    else
      all
    end
  end

end
