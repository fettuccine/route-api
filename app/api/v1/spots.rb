module V1
  class Spots < Grape::API
    # http://localhost:3000/api/v1/routes/list
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
