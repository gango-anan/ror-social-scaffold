class Bond < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def confirm_friendship
  end
end
