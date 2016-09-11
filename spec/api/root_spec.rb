require 'spec_helper'

describe Root::API do
  context "GET /api/v1/routes" do
    it "return empty array" do
      get '/api/v1/routes'
      expect(response.status).to eq(200)
    end
  end
end
