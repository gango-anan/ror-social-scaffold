class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  default_scope -> { order(:id)}

  has_many :direct_friendships, class_name: 'Bond', foreign_key: 'user_id', dependent: :destroy
  has_many :direct_friends, through: :direct_friendships, source: :friend
  has_many :indirect_friendships, class_name: 'Bond', foreign_key: 'friend_id', dependent: :destroy
  has_many :indirect_friends, through: :indirect_friendships, source: :user

  def invite_to_friendship(user)
    direct_friends << user
  end

  def reject_friendship_request(user)
    direct_friends.delete(user)
  end

end
