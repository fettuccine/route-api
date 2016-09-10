module Root
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    # http://localhost:3000/api/v1/routes/list
    resource :routes do
      desc 'Return all route.'
      get do
        {:a => "test"}
      end
    end
  end
end
