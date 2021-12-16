class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :tweet_comments,dependent: :destroy
  has_many :map_comments, dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed
  has_many :bookmarks,dependent: :destroy
  attachment :profile_image

  #フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  #フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  #フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  def name
    last_name + first_name
  end
end
