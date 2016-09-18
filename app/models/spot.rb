class Spot
  include Neo4j::ActiveNode
  property :name, type: String
  property :desc, type: String
  property :long, type: Float
  property :lat, type: Float
end
