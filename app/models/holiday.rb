class Holiday < ApplicationRecord

  has_one_attached :image_id
  belongs_to :user

  validates :content, presence: true

  def get_image
    image_id
  end


end
