require 'rails_helper'

RSpec.describe EquationsController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:equation) { FactoryBot.create :equation }

  describe '#index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end

    it 'returns a 200 response' do
      get :index
      expect(response).to have_http_status '200'
    end
  end

  describe '#show' do
    context 'as an authorized user' do
      before(:each) { sign_in user }

      it 'responds successfully' do
        get :show, params: { id: equation.id }
        expect(response).to be_successful
      end

      it 'returns a 200 response' do
        get :show, params: { id: equation.id }
        expect(response).to have_http_status '200'
      end
    end

    context 'guest' do
      it 'returns a 302 response' do
        get :show, params: { id: equation.id }
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        get :show, params: { id: equation.id }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
