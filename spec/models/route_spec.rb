require 'spec_helper'

describe Route do
  before(:each) do
    Spot.delete_all
  end
  it 'create record' do
    @spot1 = Spot.new(name: 'test1')
    @spot2 = Spot.new(name: 'test2')
    rel1 = Route.create(from_node: @spot1, to_node: @spot2)
    expect(@spot1.spots.count).to eq 1
    expect(@spot2.spots.count).to eq 0
    #route should exist.
    @spot1.spots.each_rel do |rel|
      expect(rel.class).to eq Route
    end
    retl2 = Route.create(from_node: @spot2, to_node: @spot1)
    expect(@spot1.spots.count).to eq 1
    expect(@spot2.spots.count).to eq 1
    #route should exist.
    @spot2.spots.each_rel do |rel|
      expect(rel.class).to eq Route
    end
  end
end
