class Spot
  include Neo4j::ActiveNode
  property :name, type: String
  property :desc, type: String
  property :longitude, type: Float
  property :latitude, type: Float
end
