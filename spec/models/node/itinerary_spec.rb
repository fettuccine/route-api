require 'spec_helper'

describe Itinerary do
  before(:each) do
    Itinerary.delete_all
  end
  it 'should create' do
    @itinerary = Itinerary.create(name: 'tiesto')
    @itinerary.save
    expect(Itinerary.all.size).to eq 1
  end
end
