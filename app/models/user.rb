class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  default_scope -> { order(:id) }

  has_many :unconfirmed_friendships,
           -> { where confirmed: false },
           class_name: 'Bond', dependent: :destroy
  has_many :unconfirmed_friends, through: :unconfirmed_friendships, source: :friend

  has_many :confirmed_friendships,
           -> { where confirmed: true },
           class_name: 'Bond', dependent: :destroy
  has_many :confirmed_friends, through: :confirmed_friendships, source: :user
  
  def friends_and_own_posts
    Post.where(user: (self.confirmed_friends.to_a << self))
  end

  def my_confirmed_friends
    self.confirmed_friends.to_a
  end

  def my_unconfirmed_friends
    self.unconfirmed_friends.to_a
  end
end
