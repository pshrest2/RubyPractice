Rails.application.routes.draw do
  root "main#index"
  resources :about
  resources :articles do
    resources :comments
  end
end
