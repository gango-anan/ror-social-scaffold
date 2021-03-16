class Bond < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def accept_friend
    self.update_attributes(confirmed: true)
    friend.create_reversed_row(user)
  end
end
