require 'spec_helper'

describe Route do
  before(:each) do
    Route.delete_all
  end
  it 'create record' do
    @route = Route.create
    @route.name = 'test'
    @route.save
    expect(Route.all.size).to eq 1
  end
end
