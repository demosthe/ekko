Rails.application.routes.draw do
  root to: "ekkos#index"
  devise_for :users

  resources :ekkos, only: [:index]
  resources :users, only: [:show, :index] do
    collection do
      get :search
    end
  end
  resources :relationships, only: [:create, :destroy]
end
