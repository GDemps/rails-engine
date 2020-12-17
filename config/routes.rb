Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants, path: '/merchants/:id' do
        resources :items, only: [:index]
      end
      namespace :items, path: '/items/:id' do
        get '/merchant', to: 'merchants#show'
      end
      resources :merchants, except: [:new, :edit]
      resources :items, except: [:new, :edit]
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

end
