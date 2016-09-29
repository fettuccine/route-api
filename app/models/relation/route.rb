class Route
  include Neo4j::ActiveRel

  from_class :Spot
  to_class :Spot
  type 'route'

  property :name, type: String
  property :desc, type: String
  property :created_at
  property :updated_at
end
