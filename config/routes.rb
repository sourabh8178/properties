Rails.application.routes.draw do
  get 'companies/index'
  get 'companies/edit'
  get 'companies/update'
  get 'companies/show'
  get 'post/index'
  get 'post/new'
  get 'post/show'
  post 'change_password', to: "profiles#change_password"
  get 'programming', to: "profiles#programming"
  devise_for :users
  resources :users
  get "profiles", to: "profiles#index"
  resources :profiles
  resources :posts
  get "/profile/new", to: "profiles#new"
  get "/properties/new", to: "properties#new"
  get "/home/property/:id", to: "home#show", as: "home_property"
  post "/home/property/:id", to: "properties#feedback"
  get "/agent/:id", to: "home#agent_view"
  get "view_all_property", to: "home#view_all_property"
  get "agent_list", to: "home#agent_list"
  # post "/properties/new", to: "properties#create"
  get "properties/:id", to: "properties#show", as: "property"
  root "home#index"
  get "about", to: "home#about"
  resources :properties
  resources :companies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/search", to: "home#index"
  namespace :admin do
    root "dashboard#index"
    resources :companies
    resources :users
    resources :properties
    resources :users
    # get "properties", to: "properties#index"    
  end
end
