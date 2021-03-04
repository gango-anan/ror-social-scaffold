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
  has_many :followngs, -> { where('bonds.state = ?', Bond::FOLLOWING) }, through: :bonds, source: :friend
  has_many :follow_request, -> { where('bonds.state = ?', Bond::REQUESTING) }, through: :bonds, source: :friend
end
