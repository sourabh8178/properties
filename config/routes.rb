Rails.application.routes.draw do
  get 'programming', to: "profiles#programming"
  devise_for :users
  resources :users
  resources :profiles
  resources :posts
  resources :properties
  resources :companies
  get "profiles", to: "profiles#index"
  post 'change_password', to: "profiles#change_password"
  get "/profile/new", to: "profiles#new"
  get "/properties/new", to: "properties#new"
  get "/home/property/:id", to: "home#show", as: "home_property"
  post "/home/property/:id", to: "properties#feedback"
  get "/agent/:id", to: "home#agent_view"
  get "view_all_property", to: "home#view_all_property"
  get "agent_list", to: "home#agent_list"
  get "properties/:id", to: "properties#show", as: "property_show"
  root "home#index"
  get "about", to: "home#about"
  get "/search", to: "home#index"
  namespace :admin do
    root "dashboard#index"
    resources :companies
    resources :users
    resources :properties
    resources :users
    resources :profiles
    # get "properties", to: "properties#index"    
  end
end
