Manderley::Application.routes.draw do
  resources :people

  resources :movies do
    resources :comments, shallow: true
    get "cast/new", to: 'movies#new_cast', as: :new_cast
    post "cast", to: 'movies#create_cast', as: :create_cast
  end
  resources :people

  get "search/new", to: "search#new", as: :new
  post "search", to: "search#create", as: :create
  get "search/show", to:  "search#show", as: :show
  root 'movies#index'
end
