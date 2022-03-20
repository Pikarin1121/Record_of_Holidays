class Relationship < ApplicationRecord

  belongs_to :following, class_name: 'User'
  belongs_to :follower, class_name: 'User'

  def create_notification_follow!(current_user, follower_id)
    p follower_id
    temp = Notification.where("visitor_id = #{current_user.id} and visited_id = #{follower_id} and action = 'follow'" )
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: follower_id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

end
