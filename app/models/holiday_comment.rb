class HolidayComment < ApplicationRecord

  has_one_attached :image_id
  belongs_to :user
  belongs_to :holiday

  def get_image
    image_id
  end

end
