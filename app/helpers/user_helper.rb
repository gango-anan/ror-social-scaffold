module UserHelper
  def manage_create_friendship(user)
    return if current_user == user

    render partial: 'users/create_bond' unless current_user.check_if_my_friend(user)
  end

  def manage_requests_to_me(user)
    return unless current_user.pending_friends.include?(user)

    render 'users/accept'
  end
end
