class Tweet < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :tweet_comments, dependent: :destroy

  validates :caption, length: { minimum: 0, maximum: 50 }
  validates :image, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
