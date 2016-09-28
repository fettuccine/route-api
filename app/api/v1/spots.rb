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
        requires :id, type: String, desc: 'Spot id.'
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
        @spot.save ? @spot : nil
      end

      desc 'Update specified spot id.'
      params do
        requires :id, type: String, desc: 'Spot id.'
      end
      put ':id' do
        @spot = Spot.find(params[:id])
        @spot.name = params[:name] if params[:name]
        @spot.long = params[:long] if params[:long]
        @spot.lat = params[:lat] if params[:lat]
        @spot.desc = params[:desc] if params[:desc]
        @spot.save ? @spot : nil
      end

      desc 'Delete specific spot id'
      params do
        requires :id, type: String, desc: 'Spot id.'
      end
      delete ':id' do
        @spot = Spot.find(params[:id])
        @spot.destroy
      end
    end
  end
end
