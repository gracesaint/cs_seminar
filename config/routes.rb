Rails.application.routes.draw do
  get 'search/index'

  get 'search/results'
  resources :search

  get 'static_pages/home'

  get 'static_pages/display'

  get 'static_pages/search'
  
  #search bar routes
  get 'static_pages/search', to: 'static_pages#search'
  post 'static_pages/display', to: 'static_pages#display'

  resources :reviews
  resources :orders
  resources :order_items
  resources :products do
    resources :reviews, except: [:show, :index]
  end
  get 'sessions/new'
  
#  match '/auth/:provider/callback', to: 'sessions#create', via: :get


#  match "/login" => redirect("/auth/twitter"), as: :login, via: :get
#  match "/logout" => "sessions#destroy", as: :logout, via: :get


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
