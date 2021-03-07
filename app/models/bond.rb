class Bond < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  scope :confirmed_friendship, -> { where(state: true) }
  scope :pending_friendship, -> { where(state: false) }
end
