Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/ice_cream_shops', to: 'ice_cream_shops#index'
  get '/ice_cream_shops/new', to: 'ice_cream_shops#new'
end
