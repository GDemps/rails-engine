Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :books
      resources :stores, only: [:index, :show]
    end
  end
end

# module Api
#   module V1
#     module Merchants
#       class SearchController
#         def show
#         # code omitted
#         end
#       end
#     end
#   end
# end
