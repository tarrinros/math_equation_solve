require 'rails_helper'

RSpec.describe "Equations", type: :request do
  describe "GET /equations" do
    it "works! (now write some real specs)" do
      get equations_path
      expect(response).to have_http_status(200)
    end
  end
end
