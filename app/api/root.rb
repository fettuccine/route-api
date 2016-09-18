module Root
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

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

    # http://localhost:3000/api/v1/routes/list
    resource :routes do
      desc 'Return all route.'
      get do
        Route.all
      end
      desc 'Return specified route id.'
      params do
        requires :id, type: Integer, desc: 'Spot id.'
      end
      get ':id' do
        Route.find(params[:id])
      end
      desc 'Create a new route.'
      params do
        requires :name, type: String
      end
      post do
        @route = Route.create(name: params[:name])
        @route.save
      end
    end
    resource :spots do
      desc 'Return all spot.'
      get do
        Spot.all
      end
      desc 'Return specified spot id.'
      params do
        requires :id, type: Integer, desc: 'Spot id.'
      end
      get ':id' do
        Spot.find(params[:id])
      end
      desc 'Create a new route.'
      params do
        requires :name, type: String
      end
      post do
        @spot = Spot.create(name: params[:name])
        @spot.save
      end
    end
  end
end
