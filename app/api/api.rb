module API
  class Root < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    mount V1::Base
    mount V2::Base

  end
end
