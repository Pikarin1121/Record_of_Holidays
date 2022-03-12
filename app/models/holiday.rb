class Holiday < ApplicationRecord

  has_one_attached :image_id
  belongs_to :user
  has_many :holiday_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

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


end
