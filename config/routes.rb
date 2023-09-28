Rails.application.routes.draw do
  get 'restaurants/index'
  get 'restaurants/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # post 'api/test', to: 'application#test'
  # resources :restaurants, only: [:show]
  namespace :api, defaults: { format: :json } do
    get "restaurants/search", to: "restaurants#search"
    resources :users, only: :create
    resource :session, only: [:show, :create, :destroy]
    resources :restaurants, only: [:index, :show]
    resources :reservations, only: [:index, :create, :show, :update, :destroy]
  end

  get '*path', to: "static_pages#frontend_index"
end
