class HolidayComment < ApplicationRecord

  has_one_attached :image_id
  belongs_to :user
  belongs_to :holiday
  has_many :notifications, dependent: :destroy

  def get_image
    image_id
  end

end
