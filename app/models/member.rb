class Member < ApplicationRecord
  
  devise :database_authenticatable, :registerable, :recoverable,
          :rememberable, :omniauthable, :validatable

  # バリデーション
  validates :email, :name, :address, :birthday, :prefecture_code, presence: true
  validates :postcode, length: { is: 7 }, numericality: true
  validates :is_deleted, inclusion: {in: [true, false]}
  validates :sex, inclusion: {in: [true, false]}
  
  attachment :profile_image

  # facebookログイン
  def self.find_for_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.profile_image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
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
    # if temp.blank?
    notification = current_member.active_notifications.new(visited_id: id, action: "follow")
    notification.save
    # end
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

end
