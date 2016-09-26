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
  context "GET /api/v1/itineraries/:id" do
    it "return itineraries of id" do
      @itinerary = Itinerary.create(name: "test1")
      @itinerary.save
      get "/api/v1/itineraries/#{@itinerary.id}"
      expect(response.status).to eq 200
    end
  end
  context "POST /api/v1/itineraries" do
    it "create many new itineraries" do
      expect(Itinerary.all.size).to eq 0
      statuses = {name: "test2"}
      post '/api/v1/itineraries', statuses.to_json, 'CONTENT_TYPE' => 'application/json' do
        expect(response.body).to eq 201
      end
      expect(Itinerary.all.size).to eq 1
    end
  end
end
