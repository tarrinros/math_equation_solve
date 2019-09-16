require 'rails_helper'

RSpec.describe EquationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/equations').to route_to('equations#index')
    end

    it 'routes to #show' do
      expect(get: '/equations/1').to route_to('equations#show', id: '1')
    end

    it 'routes to #solve' do
      expect(post: '/equations/solve').to route_to('equations#solve')
    end
  end
end