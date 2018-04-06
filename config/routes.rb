Rails.application.routes.draw do
  resources :orders
  resources :order_items
  resources :products
  get 'sessions/new'

  resources :users
  get 'main/contact'

  get 'main/display'

  get 'main/home'
  
  root 'main#home'
  
  get '/signup', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  
  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
