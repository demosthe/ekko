Rails.application.routes.draw do
  root to: "ekkos#index"
  devise_for :users

  resources :ekkos, only: [:index]
  resources :users, only: [:show, :index] do
    collection do
      get :search
      get :following
    end
  end

  resources :relationships, only: [:create, :destroy]

  get "search_soundcloud" => "soundcloud#search"
  get "record_soundcloud" => "soundcloud#record"
  post "import_soundcloud_user" => "soundcloud#import_user"
end
