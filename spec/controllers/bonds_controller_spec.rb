require 'rails_helper'

RSpec.describe BondsController, type: :controller do
    describe '#index' do
        it 'returns a success response' do
            expect(response).to have_http_status(:success)
        end

        it 'renders the index page properly' do
            expect(response).to render_template :index
        end
    end
end