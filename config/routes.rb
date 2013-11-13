Manderley::Application.routes.draw do
  resources :people

  resources :movies do
    resources :comments, shallow: true
  end
  resources :people, shallow: true
  
  root 'movies#index'
end
