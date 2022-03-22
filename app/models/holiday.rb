class Holiday < ApplicationRecord

  has_one_attached :image_id
  belongs_to :user
  has_many :holiday_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :notifications, dependent: :destroy

  validates :content, presence: true

  def get_image
    image_id
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(search)
    if search != ""
      Holiday.where(['content LIKE(?)', "%#{search}%"])
    else
      Holiday.all
    end
  end

  def create_notification_like!(current_user)
    #すでにいいねされているかの検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and holiday_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    #いいねされていない場合のみ、通知レコードを作成
    p temp
    if temp.blank?
      notification = current_user.active_notifications.new(
        holiday_id: id,
        visited_id: user_id,
        action: 'like'
      )
      #自分の投稿に対するいいねの場合は、通知済みにする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      p notification.valid?
      notification.save if notification.valid?
    end
  end

  def create_notification_holiday_comment!(current_user, holiday_comment_id)
    #自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = HolidayComment.select(:user_id).where(holiday_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_holiday_comment!(current_user, holiday_comment_id, temp_id['user_id'])
    end
    #まだ誰もコメントしていない場合、投稿者に通知
    save_notification_holiday_comment!(current_user, holiday_comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_holiday_comment!(current_user, holiday_comment_id, visited_id)
    #コメントが複数回されることがあるため、1つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      holiday_id: id,
      holiday_comment_id: holiday_comment_id,
      visited_id: visited_id,
      action: 'holiday_comment'
    )
    #自分の投稿に対するコメントの場合に通知済み
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

end
