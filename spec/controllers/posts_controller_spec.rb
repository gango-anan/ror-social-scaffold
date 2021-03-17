require 'rails_helper'

#   def create
#     @post = current_user.posts.new(post_params)

#     if @post.save
#       redirect_to posts_path, notice: 'Post was successfully created.'
#     else
#       timeline_posts
#       render :index, alert: 'Post was not created.'
#     end
#   end

RSpec.describe PostsController, type: :controller do
  login_user

  describe '#index' do
    before do
      get :index
    end

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index page properly' do
      expect(response).to render_template :index
    end
  end
end
