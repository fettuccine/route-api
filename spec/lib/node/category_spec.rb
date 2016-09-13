require 'spec_helper'
require_relative '../../../lib/node/category'

describe Category do
  it 'should create' do
    Category.create(name: 'Leisure')
  end
end
