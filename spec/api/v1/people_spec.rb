require 'spec_helper'

describe V1::People do
  before(:each) do
    Person.delete_all
  end

  context "GET /api/v1/people" do
    it "return all person" do
      get '/api/v1/people'
      expect(response.status).to eq 200
    end
  end

  context "GET /api/v1/people/:id" do
    it "return person id" do
      @person = Person.create(name: "test1")
      @person.save
      get "/api/v1/people/#{@person.id}"
      expect(response.status).to eq 200
    end
  end

  context "PUT /api/v1/people/:id" do
    it "update id" do
      @person = Person.create(name: "test1")
      @person.save
      statuses = {name: "test2"}
      put "/api/v1/people/#{@person.id}", statuses.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq 200
      expect(response.body).to contain "test2"
    end
  end

  context "POST /api/v1/people" do
    it "create 1 new person" do
      expect(Person.all.size).to eq 0
      statuses = {name: "test"}
      post '/api/v1/people', statuses.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq 201
      expect(Person.all.size).to eq 1
    end
  end
end
