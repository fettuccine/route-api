class Path
  include Neo4j::ActiveRel
  property :name, type: String
end
