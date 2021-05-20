# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/ice_cream_shops', to: 'ice_cream_shops#index'
  post '/ice_cream_shops', to: 'ice_cream_shops#create'
  get '/ice_cream_shops/new', to: 'ice_cream_shops#new'
  get '/ice_cream_shops/:id', to: 'ice_cream_shops#show'
  get '/ice_cream_shops/:id/edit', to: 'ice_cream_shops#edit'
  patch '/ice_cream_shops/:id', to: 'ice_cream_shops#update'
  delete '/ice_cream_shops/:id', to: 'ice_cream_shops#destroy'

  get '/flavors', to: 'flavors#index'
  post '/flavors', to: 'flavors#create'
  get '/flavors/new', to: 'flavors#new'
  get '/flavors/:id', to: 'flavors#show'
  get '/flavors/:id/edit', to: 'flavors#edit'
  patch '/flavors/:id', to: 'flavors#update'
  delete '/flavors/:id', to: 'flavors#destroy'

  get '/ice_cream_shops/:id/flavors', to: 'ice_cream_shops#flavors'
  get '/ice_cream_shops/:id/flavors/new', to: 'ice_cream_shops#new_flavor'
  post '/flavors', to: 'flavors#create'
  get '/flavors/:id', to: 'flavors#show'

  post '/ice_cream_shops/:id/flavors', to: 'ice_cream_shops#flavors'

  # get '/flavors', to: 'flavors#index'
end
