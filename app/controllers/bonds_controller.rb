class BondsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pending_sent_requests = current_user.unconfirmed_sent_requests
    @pending_received_requests = current_user.unconfirmed_received_requests
  end

  def create
    bond = current_user.unconfirmed_friendships.build(friend_id: params[:friend_id])
    if bond.save
      redirect_to user_bonds_path(current_user), notice: 'Friendship Invitation successfully sent.'
    else
      redirect_to users_path, alert: bond.errors.full_messages.join('. ').to_s
    end
  end

  def update
    bond = Bond.find(params[:id])
    bond.accept_friend
    redirect_to user_bonds_path(current_user), notice: 'Request accepted successfully!'
  end

  def destroy
    bond = Bond.find(params[:id])
    bond.destroy
    redirect_to user_bonds_path(current_user), alert: 'Request rejected.'
  end
end
