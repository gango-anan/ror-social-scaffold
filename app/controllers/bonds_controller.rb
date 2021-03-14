class BondsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bonds = current_user.my_friendships
    @friends = current_user.my_friends
    @confirmed_friends = current_user.confirmed_friends
  end

  def invitations
    @pending_friends = Bond.all.where(friend: current_user).map{ |bond| bond.user }
    @unconfirmed_sent_requests = current_user.unconfirmed_sent_requests
  end

  def new
    @bond = Bond.new
  end

  def show; end

  def create
    user = User.find(params[:friend_id])
    current_user.invite_to_friendship(user)
    redirect_to bonds_invitations_path, notice: 'Friendship Invitation Sent Succesfully.'
  end

  def update
    user = Bond.find(params[:id]).user
    current_user.confirm_friendship(user)
  end

  def destroy
    bond = Bond.find(params[:id])
    bond.destroy
    redirect_to bonds_invitations_path
  end
end
