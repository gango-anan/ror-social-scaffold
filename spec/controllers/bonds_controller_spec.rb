require 'rails_helper'

RSpec.describe BondsController, type: :controller do
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

    describe '#invitations' do
        before do
            get :invitations
        end

        it 'returns a success response' do
            expect(response).to have_http_status(:success)
        end

        it 'renders the invitations page properly' do
            expect(response).to render_template :invitations
        end
    end

    describe '#invitations' do
        before do
            get :invitations
        end

        it 'returns a success response after loading a new page for creating a bond' do
            expect(response).to have_http_status(:success)
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

    describe '#destroy' do
        it 'deletes a bond by rejecting a request.' do
            bond = create(:bond)
            expect { delete :destroy, params: { id: bond.id }}.to change(Bond, :count).by(-1)
        end
    end

end