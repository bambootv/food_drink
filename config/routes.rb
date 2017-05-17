Rails.application.routes.draw do
  root "home_pages#home"

  get "home_pages/home"
  get "home_pages/about"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/orderslist", to: "orders#index"

  resource :orders
  resources :orders
  resources :users
  resources :ratings
  resources :products
  resources :comments
  resources :categories
  resources :searches, only: [:index, :new]
end
