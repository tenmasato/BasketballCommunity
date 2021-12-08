class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets,dependent: :destroy
  has_many :favorites,dependent: :destroy
  attachment :profile_image

  def name
    last_name + first_name
  end
end
