Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root to: "pages#home"

  devise_for :users
  get '/dashboard', to: 'users#dashboard'

  resources :assets, only: [:index, :show] do
    resources :holdings, only: [:new, :create, :update]
    resources :histories
  end

  resources :channels, only: [:index, :show, :new, :create, :destroy] do
    resources :comments, only: [:new, :create, :destroy]
  end

  resources :news, only: [:index, :show] do
    # post '/like', to: 'news#like'
    # post '/dislike', to: 'news#dislike'
  end
end
