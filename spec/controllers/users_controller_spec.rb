require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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

  describe '#show' do
    let(:user) { create(:user) }
    before do
      get :show, params: { id: user.id }
    end

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the invitations page properly' do
      expect(response).to render_template :show
    end
  end
end
