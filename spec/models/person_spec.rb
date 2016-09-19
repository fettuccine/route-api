require 'spec_helper'

describe Person do
  before(:each) do
    Person.delete_all
  end
  it 'should create' do
    @person = Person.create(name: 'tiesto')
    @person.save
    expect(Person.all.size).to eq 1
  end
end
