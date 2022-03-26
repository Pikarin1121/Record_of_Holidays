class Chat < ApplicationRecord

  belongs_to :user
  belongs_to :room

  validates :message, presence: true

  has_many :notifications, dependent: :destroy

  def create_notification_dm!(user, chat)
    #自分以外の情報を除いた、ユーザールームを取ってくる（相手のユーザールームを取ることになる
    @other_member = UserRoom.where(room_id: chat.room_id).where.not(user_id: user.id).first
    notification = user.active_notifications.build(
      room_id: chat.room_id,
      chat_id: chat.id,
      visited_id: @other_member.user_id,
      action: 'dm'
    )

    notification.save if notification.valid?
  end

end
