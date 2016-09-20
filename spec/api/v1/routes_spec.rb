require 'spec_helper'

def create_spot(name)
  @spot = Spot.create(
    name: "#{name}",
    desc: 'Loren Ipsum',
    long: 180.0,
    lat: 90.0
  )
  @spot.save
  return @spot.id
end

describe V1::Routes do
  before(:each) do
    Spot.delete_all
    @spot_id1 = create_spot("spot1")
    @spot_id2 = create_spot("spot2")
  end
  context "POST /api/v1/routes" do
    it 'should create route' do
      create_route_object = {
        name: "test",
        from: @spot_id1,
        to:   @spot_id2,
        desc: "Loren Ipsum"
      }
      post '/api/v1/routes', create_route_object.to_json, 'CONTENT_TYPE' => 'application/json' do
        expect(response.body).to eq 201
      end
    end
  end
end
