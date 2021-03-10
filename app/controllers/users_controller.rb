class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  # def friends
  #   @friends = current_user.confirmed_friends
  # end

  def incoming_requests
    @incoming = current_user.pending_friends
  end

  def outgoing_requests
    @outgoing = current_user.unconfirmed_sent_requests
  end
end
