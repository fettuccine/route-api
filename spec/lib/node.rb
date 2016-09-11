require 'spec_helper'

describe Node do
  describe Node.instance do
    it 'should be same instance when called twice' do
      expect(Node.instance).to eq(Node.instance)
    end
  end
end
