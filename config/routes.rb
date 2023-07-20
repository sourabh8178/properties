Rails.application.routes.draw do
  devise_for :users
  resources :users
  root "profiles#index"
  resources :profiles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :admin do
    root "dashboard#index"
    resources :companies
    # resources :users
    resources :properties
  end
end
