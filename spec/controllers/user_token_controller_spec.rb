require 'rails_helper'

RSpec.describe UserTokenController, type: :controller do
  describe 'POST index' do
    let(:user) { FactoryGirl.create(:user, email: 'john@example.com', password: 'helloworld') }

    it 'responds a JWT token when submitting valid credentials' do
      post :create, params: { auth: { email: user.email, password: 'helloworld' } }

      expect(response).to have_http_status(:created)
      expect(response.body).to include('jwt')
    end

    it 'fails when submitting invalid credentials' do
      post :create, params: { auth: { email: user.email, password: 'thisisbad' } }
      expect(response).to have_http_status(:not_found)
    end
  end
end
