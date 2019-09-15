require 'rails_helper'

RSpec.describe 'Equations', type: :request do
  let(:user) { FactoryBot.create :user }
  let(:equation) { FactoryBot.create :equation }

  describe 'request list of all equations' do
    it 'responds successfully' do
      get equations_path
      expect(response).to be_successful
      expect(response.body).to include('Please, choose the type of equation to solve')
    end
  end

  describe 'POST /solve' do
    it 'does not raise an error' do
      expect { post equation_solve_path }.to_not raise_error
    end
  end
end