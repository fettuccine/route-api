module V1
  class Base < Grape::API

    rescue_from Neo4j::ActiveNode::Labels::RecordNotFound do |e|
      rack_response({ message: e.message, status: 404 }.to_json, 404)
    end

    rescue_from :all do |e|
      if Rails.env.development?
        raise e
      else
        error_response(message: "Internal server error", status: 500)
      end
    end

    mount V1::Routes
    mount V1::Spots
    mount V1::Itineraries
    mount V1::People
  end
end
