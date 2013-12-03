Manderley::Application.routes.draw do
  root 'movies#index'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  get "profile", to: "users#profile", as: :profile
  resources :people
  resources :addresses

  resources :movies do
    resources :comments, shallow: true
    get "cast/new", to: 'movies#new_cast', as: :new_cast
    post "cast", to: 'movies#create_cast', as: :create_cast
  end

  get "search/new", to: "search#new", as: :new
  post "search", to: "search#create", as: :create
  get "search/show", to:  "search#show", as: :show

  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)
end
