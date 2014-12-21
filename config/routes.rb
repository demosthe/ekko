Rails.application.routes.draw do
  root to: "ekkos#index"
  devise_for :users

  resources :users, only: [:show]
  resources :relationships, only: [:create, :destroy]
end
