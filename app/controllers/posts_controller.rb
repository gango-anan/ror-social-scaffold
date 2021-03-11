class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    @timeline_posts = timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def timeline_posts
    timeline_post ||= Post.all.ordered_by_most_recent.includes(:user)
    all_users = current_user.confirmed_friends
    timeline_post.map{ |post| post if all_users.include?(post.user) || post.user == current_user }.compact
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
