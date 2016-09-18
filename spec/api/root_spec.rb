require 'spec_helper'

describe Root::API do
  context "GET /api/v1/routes" do
    it "return empty array" do
      get '/api/v1/routes'
      expect(response.status).to eq 200
    end
    it "return routes of id" do
      get '/api/v1/routes/1'do
        expect(response.status).to eq 200
      end
    end
  end
  context "GET /api/v1/spots" do
    it "return all spot" do
      get '/api/v1/spots' do
        expect(response.status).to eq 200
      end
    end
    it "return spot of id" do
      get '/api/v1/spots/1' do
        expect(response.status).to eq 200
      end
    end
  end
end
