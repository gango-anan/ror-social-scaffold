module UserHelper
    def manage_invite_requests(user)
        if current_user.check_friend(current_user, user)
            return 'Friend'
        end
        render 'users/invite'
    end
  end