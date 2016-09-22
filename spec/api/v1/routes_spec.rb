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
      post '/api/v1/routes', create_route_object.to_json, 'CONTENT_TYPE' => 'application/json' do
        expect(response.body).to eq 201
      end
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
      post '/api/v1/routes', create_route_object.to_json, 'CONTENT_TYPE' => 'application/json' do
        expect(response.body).to eq 201
      end
      expect(@spot1.spots.count).to eq 0
      expect(@spot2.spots.count).to eq 0
    end
    it 'should delete route' do
      delete '/api/v1/routes/1' do
        expect(response.body).to eq 201
      end
    end
  end
end
