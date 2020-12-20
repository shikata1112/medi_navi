class Review < ApplicationRecord
  belongs_to :member
  belongs_to :clinic

  # タグ付け機能
  acts_as_taggable

  validates :title, :comment, presence: true

  def save!(review, current_member, score)
    review.member_id = current_member.id
    review.score = score
    review.save!
  end

end
