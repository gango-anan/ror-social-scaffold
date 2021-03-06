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
  has_many :friends, -> { Bond.confirmed_friendship }, through: :bonds, source: :friend
  has_many :friend_requests, -> { Bond.pending_friendship }, through: :bonds, source: :friend
  has_many :inward_bonds, class_name: 'Bond', foreign_key: :friend_id
  has_many :inward_friends, -> { Bond.confirmed_friendship }, through: :inward_bonds, source: :user

  def friends
    direct_friends = bonds.select{ |bond| bond.friend if bond.state }
    inward_friends = bonds.select{ |bond| bond.user if bond.state }

    direct_friends + inward_friends
  end
end
