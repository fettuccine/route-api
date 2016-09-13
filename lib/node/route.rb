class Route
  include Neo4j::ActiveNode
  include Neo4j::Timestamps
  
  property :name, type: String
  property :rating, type: Float
  property :desciption, type: String
end
