module UserHelper
    def manage_invite_requests(user)
        return if current_user == user
        return render 'users/invite' unless current_user.check_if_my_friend(user)

        'Friend'
    end
  end