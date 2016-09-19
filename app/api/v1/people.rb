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
        requires :id, type: Integer, desc: 'Person id.'
      end
      get ':id' do
        Person.find(params[:id])
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
