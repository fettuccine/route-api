require 'spec_helper'

describe V1::People do
  before(:each) do
    Person.delete_all
  end
  context "GET /api/v1/people" do
    it "return all person" do
      get '/api/v1/people' do
        expect(response.status).to eq 200
      end
    end
  end
  context "GET /api/v1/people/1" do
    it "return person id" do
      get '/api/v1/people/1' do
        expect(response.status).to eq 200
      end
    end
  end
  context "POST /api/v1/people" do
    it "create 1 new person" do
      statuses = {name: "test"}
      post '/api/v1/people', statuses.to_json, 'CONTENT_TYPE' => 'application/json' do
        expect(response.body).to eq 201
      end
      expect(Person.all.size).to eq 1
    end
  end
end
