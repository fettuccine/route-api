module V1
  class Routes < Grape::API
    # http://localhost:3000/api/v1/routes/list
    resource :routes do
      desc 'Return all route.'
      get do
        Route.all
      end

      desc 'Return specified route id.'
      params do
        requires :id, type: String, desc: 'Spot id.'
      end
      get ':id' do
        Route.find(params[:id])
      end

      desc 'Create a new route.'
      params do
        requires :name, type: String
        requires :from, type: String
        requires :to, type: String
      end
      post do
        Route.create(from_node: Spot.find(params[:from]), to_node: Spot.find(params[:to]))
      end
      desc 'Remove specified route id'
      params do
        requires :id, type: String, desc: 'Spot id.'
      end
      delete ':id' do
        @route = Route.find(params[:id])
        @route.destroy
      end
    end
  end
end
