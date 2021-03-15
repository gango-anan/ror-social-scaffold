module UserHelper
  def manage_create_friendship(user)
    bonds = Bond.where(friend: current_user, user: user, confirmed: false)
    friend = bonds.map{ |bond| bond.user }
    return if current_user == user || friend.include?(user)

    #render partial: 'users/create_bond' unless current_user.check_if_my_friend(user)
    render partial: 'users/create_bond'
  end

  def manage_requests_to_me(user)
    return unless current_user.pending_friends.include?(user)

    render 'users/accept'
  end
end
