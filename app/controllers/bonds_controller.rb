class BondsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    user = User.find(params[:friend_id])
    current_user.invite_to_friendship(user)
    redirect_to users_path
  end

  def update
    user = User.find(params[:user_id])
    current_user.confirm_friendship(user)
    redirect_to users_path
  end

  def destroy
    user = Bond.find(params[:id]).friend
    current_user.reject_friendship_request(user)
    redirect_to current_user
  end
end
