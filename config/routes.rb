Restaurantes::Application.routes.draw do
  resources :restaurantes do
    resources :comentarios
  end
  
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'
  match '/logout' => 'sessions#destroy', :as => :logout
  match '/login' => 'sessions#new', :as => :login
  
  root :to => "restaurantes#index"
end
