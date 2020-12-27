class Review < ApplicationRecord
  belongs_to :member
  belongs_to :clinic

  # タグ付け機能
  acts_as_taggable

  validates :title, :comment, :wating_time, :score, presence: true

  # def save!(current_member, params_score)
  #   self.member_id = current_member.id
  #   self.score = params_score
  #   save
  # end

end
