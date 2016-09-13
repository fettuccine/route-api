require 'spec_helper'
require_relative '../../../lib/node/spot'

describe Spot do
  it 'should create' do
    Spot.create(name: 'Spot 123')
  end
end
