Rails.application.routes.draw do
  resources :reviews
  resources :orders
  resources :order_items
  resources :products
  get 'sessions/new'
  
  match '/auth/:provider/callback', to: 'sessions#create', via: :get


  match "/login" => redirect("/auth/twitter"), as: :login, via: :get
  match "/logout" => "sessions#destroy", as: :logout, via: :get

  root to: "products#index"

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
