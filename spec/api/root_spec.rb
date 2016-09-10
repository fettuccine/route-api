require 'spec_helper'

describe Root::API do
  context "GET /api/v1/routes/list" do
    it "return empty array" do
      get '/api/v1/routes/list'
      expect(response.status).to eq(200)
    end
  end
end
