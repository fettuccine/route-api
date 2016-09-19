class Spot
  include Neo4j::ActiveNode

  has_many :out, :spots, rel_class: :Route
  
  property :name, type: String
  property :desc, type: String
  property :long, type: Float
  property :lat, type: Float

  property :created_at
  property :updated_at
end
