Rails.application.routes.draw do
  resources :users
  resources :restaurants
  resources :favorites
  resources :tags
  ### SESSIONS
  post "/sessions" => "sessions#create"
  ### SESSIONS
  post "/restaurant_sessions" => "restaurant_sessions#create"
end
