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
           class_name: 'Bond',
           foreign_key: 'friend_id', dependent: :destroy
  has_many :unconfirmed_friends, through: :unconfirmed_friendships, source: :user

  has_many :confirmed_friendships,
           -> { where confirmed: true },
           class_name: 'Bond',
           foreign_key: 'friend_id', dependent: :destroy
  has_many :confirmed_friends, through: :confirmed_friendships, source: :user
end
