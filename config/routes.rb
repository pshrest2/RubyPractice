Rails.application.routes.draw do
  root "main#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "password", to: "password#new"
  patch "password", to: "password#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "register", to: "registration#new"
  post "register", to: "registration#create"

  get "about", to: "about#index"

  resources :articles do
    resources :comments
  end
end
