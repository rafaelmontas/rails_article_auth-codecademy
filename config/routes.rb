Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :articles
  root "articles#index"
  #Users controller (Signup setup)
  resources :users
  get "/signup" => "users#new"

  #Sessions controller rutes (Login setup)
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#drestroy"
end
