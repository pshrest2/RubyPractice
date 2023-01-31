Rails.application.routes.draw do
  root "main#index"
  
  get "about", to: "about#index"

  resources :articles do
    resources :comments
  end
end
