module V1
  class Itineraries < Grape::API
    # http://localhost:3000/api/v1/routes/list
    resource :itineraries do
      desc 'Return all itinerary.'
      get do
        Itinerary.all
      end
      desc 'Return specified itinerary id.'
      params do
        requires :id, type: String, desc: 'Spot id.'
      end
      get ':id' do
        @itinerary = Itinerary.find(params[:id])
        return @itinerary
      end

      desc 'Delete specified itinerary id.'
      params do
        requires :id, type: String, desc: 'Spot id.'
      end
      delete ':id' do
        @itinerary = Itinerary.find(params[:id])
        @itinerary.destroy
      end
      desc 'Create a new itinerary.'
      params do
        requires :name, type: String
      end
      post do
        @itinerary = Itinerary.create(name: params[:name])
        @itinerary.save
      end
    end
  end
end
