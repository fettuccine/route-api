module Root
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    # http://localhost:3000/api/v1/route/all
    resource :route do
      desc 'Return all route.'
      get :all do
        {:a => "test"}
      end
    end
  end
end
