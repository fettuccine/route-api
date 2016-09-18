class Route
  include Neo4j::ActiveNode

  property :name, type: String
  property :created_at
  property :updated_at
end
