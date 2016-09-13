class Spot
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :name, type: String
  property :longitude, type: Float
  property :latitude, type: Float
end
