Rails.application.routes.draw do
  devise_for :users
  root to: "ekkos#index"

  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
