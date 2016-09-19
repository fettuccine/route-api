require 'spec_helper'

describe V1::Itineraries do
  before(:each) do
    Itinerary.delete_all
  end
  context "GET /api/v1/itineraries" do
    it "return empty array" do
      get '/api/v1/itineraries'
      expect(response.status).to eq 200
    end
  end
  context "GET /api/v1/itineraries/1" do
    it "return itineraries of id" do
      get '/api/v1/itineraries/1'do
        expect(response.status).to eq 200
      end
    end
  end
  context "POST /api/v1/itineraries" do
    it "create many new itineraries" do
      statuses = {name: "test"}
      post '/api/v1/itineraries', statuses.to_json, 'CONTENT_TYPE' => 'application/json' do
        expect(response.body).to eq 201
      end
      expect(Itinerary.all.size).to eq 1
    end
  end
end
