module UserHelper
    def manage_invite_requests(user)
        return if current_user == user
        return render 'users/invite' unless current_user.check_if_my_friend(user)

        'Friend'
    end

    def manage_requests_to_me(user)
         return unless current_user.pending_friends.include?(user)

        render 'users/accept'
    end

    def manage_requests_to_others(user)
        return unless current_user.unconfirmed_sent_requests.include?(user)

        'pending confirmation'
    end
  end