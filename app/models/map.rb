class Map < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :map_comments,dependent: :destroy
  has_many :bookmarks,dependent: :destroy

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
