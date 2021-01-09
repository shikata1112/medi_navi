class Member < ApplicationRecord
  
  devise :database_authenticatable, :registerable, :recoverable,
          :rememberable, :omniauthable, :validatable

  # バリデーション
  validates :email, :name, :address, :birthday, :prefecture_code, presence: true
  validates :postcode, length: { is: 7 }, numericality: true
  validates :is_deleted, inclusion: {in: [true, false]}
  validates :sex, inclusion: {in: [true, false]}
  
  attachment :profile_image

  CSV_FILE_NAME = '会員一覧情報'

  # facebookログイン
  def self.find_for_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.profile_image = auth.info.image
    end
  end

  include JpPrefecture
  jp_prefecture :prefecture_code
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end     

  has_many :events, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :clinics, through: :favorites

  has_many :reviews, dependent: :destroy
  has_many :clinics, through: :reviews

  # クリニック閲覧履歴
  has_many :clinic_histories, dependent: :destroy

  # クーポン機能
  has_many :coupons, dependent: :destroy

  # DM
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy

  # フォロー機能
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  # 通知機能
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  # followの通知
  def create_notification_follow!(current_member)
    temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ?", current_member.id, id, "follow"])
    notification = current_member.active_notifications.new(visited_id: id, action: "follow")
    notification.save
  end

  # フォロー機能
  def followed_by?(member)
    passive_relationships.find_by(following_id: member.id).present?
  end

  # 会員論理削除機能
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  # google API
  geocoded_by :address
  after_validation :geocode

  def notification_create!(room, message, entry)
    notification = active_notifications.new(
      room_id: room.id,
      message_id: message.id,
      visited_id: entry.member_id,
      action: 'dm'
    )
    notification.arrived
    notification.save!
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error e.full_messages
  end
  
  def coupon_create!
    coupons.create!(limit: 1)
  end
  
  def room_ids
    entries.includes(:room).pluck('rooms.id')
  end

  def display_gender_text
    sex ? "男性" : "女性"
  end

  def display_deleted_text
    is_deleted ? "有効" : "無効"
  end

  def self.generate_csv
    CSV.generate do |csv|
      csv << csv_headers
      csv_values.each do |member|
        csv << [member.id, member.name, member.email, member.created_at.to_s(:datetime_jp)]
      end
    end
  end

  private

  def self.csv_values
    select(:id, :name, :email, :created_at)
  end

  def self.csv_headers
    %w(ID 氏名 email 登録日)
  end
  
end
