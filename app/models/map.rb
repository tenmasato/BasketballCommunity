class Map < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :map_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :counts, dependent: :destroy

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  def counted_by?(user)
    counts.where(user_id: user.id).exists?
  end
end
