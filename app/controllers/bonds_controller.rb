class BondsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    user = User.find(params[:friend_id])
    current_user.invite_to_friendship(user)
    redirect_to users_path
  end
end
