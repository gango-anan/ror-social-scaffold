require 'rails_helper'

RSpec.describe BondsController, type: :controller do
  login_user

  describe '#index' do
    let(:user) { create(:user) }
    before do
      get :index, params: { user_id: user.id }
    end

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index page properly' do
      expect(response).to render_template :index
    end
  end

  describe '#invitations' do
    let(:user) { create(:user) }
    before do
      get :friends, params: { user_id: user.id }
    end

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the friends page properly' do
      expect(response).to render_template :friends
    end
  end

  describe '#create' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    before do
      params = { friend_id: user1.id }
      post :create, params: params
    end

    it 'creates a bond' do
      params = { friend_id: user2.id }
      expect { post :create, params: params }.to change(Bond, :count).by(1)
    end
  end
end
