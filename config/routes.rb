Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # post 'api/test', to: 'application#test'
  # resources :restaurants, only: [:show]
  namespace :api, defaults: { format: :json } do
    get "restaurants/search", to: "restaurants#search"
    resources :users, only: :create
    resource :session, only: [:show, :create, :destroy]
    resources :restaurants, only: [:index, :show] do
      resources :reviews, only: [:index]
    end
    resources :reservations, only: [:index, :create, :show, :update, :destroy]
    resources :reviews, only: [:create]
  end

  get '*path', to: "static_pages#frontend_index"
end
