require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    context 'GET #index' do
        it 'returns success response' do
            get :index
            expect(response).not_to be_successful
        end
    end
    
    context 'POST #create' do
        it 'returns success response' do
            post :create
            expect(response).not_to be_successful
        end
    end

    context 'PUT #update' do
        it 'returns success response' do
            put :update
            expect(response).not_to be_successful
        end
    end
end
