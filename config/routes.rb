Restaurantes::Application.routes.draw do
  resources :restaurantes do
    resources :comentarios
  end
  
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'
  match '/logout' => 'sessions#destroy', :as => :logout
  match '/login' => 'sessions#new', :as => :login
  
  get '/meus_restaurantes' => 'restaurantes#meus_restaurantes', :as => :meus_restaurantes
  get '/meus_comentarios' => 'comentarios#meus_comentarios', :as => :meus_comentarios
  
  root :to => "restaurantes#index"
end
