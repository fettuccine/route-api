require 'spec_helper'

describe Visit do
  before(:each) do
    Spot.delete_all
    Person.delete_all
  end
  it 'create relation' do
    @spot1 = Spot.new(name: 'test1')
    @person = Person.new(name: 'tiesto')
    Visit.create(from_node: @person, to_node: @spot1)
    expect(@person.spots.count).to eq 1
    @person.spots.each_rel do |rel|
      expect(rel.class).to eq Visit
    end
  end
end
