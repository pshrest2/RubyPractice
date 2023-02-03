Rails.application.routes.draw do
  root "main#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "password", to: "password#new"
  patch "password", to: "password#update"

  get "register", to: "registration#new"
  post "register", to: "registration#create"

  get "about", to: "about#index"

  resources :articles do
    resources :comments
  end
end
