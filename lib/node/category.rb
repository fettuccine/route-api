class Category
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :name
end
