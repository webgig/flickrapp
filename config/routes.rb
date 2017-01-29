Rails.application.routes.draw do

  get 'sessions/new'

  get '/', to:  "home#index"
  get '/home', to: "home#index"  
  get '/signup', to: "users#new" 
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#login"
  delete '/logout', to: "sessions#logout"
  get '/search', to:  "images#search"

  resources :users
  
  root 'home#index'
end
