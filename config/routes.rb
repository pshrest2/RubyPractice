Rails.application.routes.draw do
  root "main#index"
  
  get "register", to: "registration#new"
  post "register", to: "registration#create"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "about", to: "about#index"

  resources :articles do
    resources :comments
  end
end
