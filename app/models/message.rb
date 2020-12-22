class Message < ApplicationRecord
  belongs_to :member
  belongs_to :room

  validates :body, presence: true

  def self.message_create!(current_member, message_params)
    message = Message.new(message_params)
    message.member_id = current_member.id
    message.save!
    message
  end
end
