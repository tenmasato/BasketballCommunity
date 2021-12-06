class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets,dependent: :destroy

  def name
    last_name + first_name
  end
end
