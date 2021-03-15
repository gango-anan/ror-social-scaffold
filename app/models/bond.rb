class Bond < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'


  def confirm_friendship(user, new_user)
    self.update_attributes(state: true)
    Bond.create!(user_id: new_user.id, friend_id: user.id, state: true)
  end
end
