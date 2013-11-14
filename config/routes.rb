Manderley::Application.routes.draw do
  resources :people

  resources :movies do
    resources :comments, shallow: true
    get "cast/new", to: 'movies#new_cast', as: :new_cast
    post "cast", to: 'movies#create_cast', as: :create_cast
  end
  resources :people
  
  root 'movies#index'
end
