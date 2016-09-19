class Visit
  include Neo4j::ActiveRel

  from_class :Person
  to_class :Spot
  type 'visited'

  property :created_at
  property :updated_at
end
