Restaurantes::Application.routes.draw do
  resources :restaurantes do
    resources :comentarios
  end
  
  root :to => "restaurantes#index"
end
