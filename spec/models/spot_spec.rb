require 'spec_helper'

describe Spot do
  before(:each) do
    Spot.delete_all
  end
  it 'should create' do
    @spot = Spot.create(
      name: 'Route 246',
      desc: 'Loren Ipsum',
      long: 180.0,
      lat: 90.0
    )
    @spot.save
    expect(Spot.all.size).to eq 1
  end
end
