class Person
  include Neo4j::ActiveNode

  has_many :out, :spots, rel_class: :Visit

  property :name, type: String
end
