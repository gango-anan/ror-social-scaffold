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
    @bonds = Bond.all
    @direct_friends = @bonds.map{ |bond| bond.friend if bond.state }
    @inward_friends = @bonds.map{ |bond| bond.user if bond.state }
    (@direct_friends + @inward_friends).compact
  end

  def user_friends(user)
    bonds = Bond.all
    direct_friends = user.bonds.map{ |bond| bond.friend if bond.state }
    indirect_friends = bonds.where(friend_id: user.id).map{ |bond| bond.user if bond.state }
    (direct_friends + indirect_friends).compact
  end

  def check_friend(user1,user2)
    user_friends(user1).include?(user2)
  end
end
