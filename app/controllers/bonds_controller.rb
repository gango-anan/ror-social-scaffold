class BondsController < ApplicationController
  before_action :authenticate_user!

  def index
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
  end

  def destroy
  end
end
