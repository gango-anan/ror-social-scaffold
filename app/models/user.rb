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
    @direct_friends = @bonds.select{ |bond| bond.friend if bond.state }
    @inward_friends = @bonds.select{ |bond| bond.user if bond.state }

    @direct_friends + @inward_friends
  end

  def unconfirmed_friends
    @bonds.select{ |bond| bond.friend unless bond.state }
  end

  def confirm_request(user)
    bond = @inward_friends.find{ |bond| bond.user == user }
    bond.state = true
    bond.save
  end

  def reject_request(user)
    bond = unconfirmed_friends.find{ |bond| bond.user == user }
    bond.delete
  end

  def check_friend(user)
    friends.include?(user)
  end
end
