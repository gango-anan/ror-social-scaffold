class BondsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @bonds = @user.my_friendships
    @friends = @user.my_friends
    @confirmed_friends = @user.confirmed_friends
    @pending_friends = @user.pending_friends
  end

  def new
    @bond = Bond.new
  end

  def show
  end

  def create
    user = User.find(params[:friend_id])
    current_user.invite_to_friendship(user)
    redirect_to bonds_path
  end

  def update
    user = Bond.find(params[:id]).user
    current_user.confirm_friendship(user)
    redirect_to bonds_path
  end

  def destroy
    bond = Bond.find(params[:id])
    bond.destroy
    redirect_to bonds_path
  end
end
