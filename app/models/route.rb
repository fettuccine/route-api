class Route
  include Neo4j::ActiveRel

  from_class :Spot
  to_class :Spot

  property :name, type: String
  property :created_at
  property :updated_at
end
