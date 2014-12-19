Rails.application.routes.draw do
  devise_for :users
  root to: "ekkos#index"

  resources :users, only: [:show]

  #todo: social network authentication
  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
