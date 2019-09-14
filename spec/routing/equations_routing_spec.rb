require 'rails_helper'

RSpec.describe LinksController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/equations').to route_to('equations#index')
    end

    it 'routes to #show' do
      expect(:get => '/equations/1').to route_to('equations#show', id: '1')
    end
  end
end