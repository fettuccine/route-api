require 'singleton'
require 'neography'

class Node
  include Singleton
  def initialize(input_hash = {})
    default_hash = {
      :username => "neo4j",
      :password => "swordfish",
      :authentication => "basic",
      :server => "localhost",
      :port => 7474,
      :protocol => "http"
    }
    merge_hash = default_hash.merge(input_hash)
    @neo = Neography::Rest.new(merge_hash)
  end
=begin
  def create(property_hash)
    @neo.create_node(property_hash)
  end

  def add_properties(node, property_hash)
    @neo.set_node_properties(property_hash)
  end

  def link(node_out, predicate, node_in)
    @neo.create_relationship(predicate_node, node_out, node_in)
  end

  def get_in(node, predicate)
    @neo.get_node_relationship(node, :in, predicate)
  end

  def get_out(node, predicate)
    @neo.get_node_relationship(node, :out, predicate)
  end

  def get_both(node, predicate)
    @neo.get_node_relationship(node, :both, predicate)
  end

  def delete(node)
    node.del
  end

  def execute_query(query)
    @neo.execute_query(query)
  end
=end
end
