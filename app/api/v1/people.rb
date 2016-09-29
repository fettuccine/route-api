module V1
  class People < Grape::API
    # http://localhost:3000/api/v1/routes/list
    resource :people do
      desc 'Return all people.'
      get do
        Person.all
      end

      desc 'Return specified people id.'
      params do
        requires :id, type: String, desc: 'Person id.'
      end
      get ':id' do
        Person.find(params[:id])
      end

      desc 'Update specified people id.'
      params do
        requires :id, type: String, desc: 'Person id.'
        optional :name, type: String, desc: 'Person name.'
      end
      put ':id' do
        @person = Person.find(params[:id])
        @person.name = params[:name] if params[:name]
        @person.save ? @person : nil
      end

      desc 'Create a new person.'
      params do
        requires :name, type: String
      end
      post do
        @person = Person.create(name: params[:name])
        @person.save
      end
    end
  end
end
