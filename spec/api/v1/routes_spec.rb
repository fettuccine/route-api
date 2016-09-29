require 'spec_helper'

def create_spot(name)
  Spot.create(
    name: "#{name}",
    desc: 'Loren Ipsum',
    long: 180.0,
    lat: 90.0
  )
end

describe V1::Routes do
  before(:each) do
    Spot.delete_all
    @spot1 = create_spot("spot1")
    @spot2 = create_spot("spot2")
  end
  context "POST /api/v1/routes" do
    it 'should create route' do
      create_route_object = {
        name: "test",
        from: @spot1.id,
        to:   @spot2.id,
        desc: "Loren Ipsum"
      }
      post '/api/v1/routes', create_route_object.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq 201
      expect(@spot1.spots.count).to eq 1
      expect(@spot2.spots.count).to eq 0
    end
    it 'should not create route' do
      create_route_object = {
        name: "test",
        from: @spot1.id,
        to:   3,
        desc: "Loren Ipsum"
      }
      post '/api/v1/routes', create_route_object.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq 404
      expect(@spot1.spots.count).to eq 0
      expect(@spot2.spots.count).to eq 0
    end
  end
  context "DELETE /api/v1/routes/1" do
    it 'should delete route' do
      @route = Route.create(from_node: @spot2, to_node: @spot1)
      delete "/api/v1/routes/#{@route.id}"
      expect(response.status).to eq 200
      expect(@route.exist?).to eq false
    end
  end
  context "PUT /api/v1/routes/1" do
    it "should update route" do
      @route = Route.create(from_node: @spot2, to_node: @spot1)
      update_route_object = {
        name: "test2",
        from: @spot1.id,
        to:   @spot2.id,
        desc: "tiesto"
      }
      put "/api/v1/routes/#{@route.id}", update_route_object.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq 200
      expect(@route.exist?).to eq true
    end
  end
end
