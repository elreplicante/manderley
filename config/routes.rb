Manderley::Application.routes.draw do
  resources :people

  resources :movies do
    resources :comments, shallow: true
    get :new_cast
    post :create_cast
  end
  resources :people
  
  root 'movies#index'
end
