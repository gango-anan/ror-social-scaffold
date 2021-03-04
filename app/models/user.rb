class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bonds
  has_many :followings, -> { Bond.following }, through: :bonds, source: :friend
  has_many :follow_requests, -> { Bond.requesting }, through: :bonds, source: :friend
  has_many :inward_bonds, class_name: 'Bond', foreign_key: :friend_id
  has_many :followers, -> { Bond.following }, through: :inward_bonds, source: :user
end
