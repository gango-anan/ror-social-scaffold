module UserHelper
    def manage_invite_requests(user)
        if user.check_friend(current_user)
            return 'Friend'
        end
        render 'users/invite'
    end
  end