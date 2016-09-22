require 'spec_helper'

describe V1::Spots do
  before(:each) do
    Spot.delete_all
  end
  context "GET /api/v1/spots" do
    it "return all spot" do
      get '/api/v1/spots' do
        expect(response.status).to eq 200
      end
    end
  end
  context "GET /api/v1/spots/1" do
    it "return spot of id" do
      get '/api/v1/spots/1' do
        expect(response.status).to eq 200
      end
    end
  end
  context "POST /api/v1/spots" do
    it "create 1 new spot" do
      statuses = {name: "test"}
      post '/api/v1/spots', statuses.to_json, 'CONTENT_TYPE' => 'application/json' do
        expect(response.body).to eq 201
      end
      expect(Spot.all.size).to eq 1
    end
  end
  context "DELETE /api/v1/spots/1" do
    it "delete 1 spot" do
      delete '/api/v1/spots/1' do
        expect(response.status).to eq 200
      end
    end
  end
  context "PUT /api/v1/spots/1" do
    it "update 1 spot" do
      status = {
        name: "test",
        desc: "Loren Ipsum",
        long: 180.0,
        lat: 90.0
      }
      put '/api/v1/spots/1', status.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
