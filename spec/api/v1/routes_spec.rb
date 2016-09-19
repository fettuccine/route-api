require 'spec_helper'

describe V1::Routes do
  before(:each) do
    Route.delete_all
  end
  context "GET /api/v1/routes" do
    it "return empty array" do
      get '/api/v1/routes'
      expect(response.status).to eq 200
    end
  end
  context "GET /api/v1/routes/1" do
    it "return routes of id" do
      get '/api/v1/routes/1'do
        expect(response.status).to eq 200
      end
    end
  end
  context "POST /api/v1/routes" do
    it "create many new routes" do
      statuses = {name: "test"}
      post '/api/v1/routes', statuses.to_json, 'CONTENT_TYPE' => 'application/json' do
        expect(response.body).to eq 201
      end
      expect(Route.all.size).to eq 1
    end
  end
end
