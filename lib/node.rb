require 'singleton'
require 'neography'

class Node
  include Singleton
  def initialize
    @neo = Neography::Rest.new
  end

  def create
  end

  def update
  end

  def delete
  end
end
