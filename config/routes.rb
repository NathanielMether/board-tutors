Rails.application.routes.draw do
  get 'menu' => 'menu#index'

  get 'contacts' => 'contacts#index'

  get '/support' => 'support#new'
  post '/support' => 'support#create'

  root "home#index"

  resources :profiles do
    resources :bookings, only: [:edit, :index, :new, :create, :update, :destroy]
    resources :reviews, only: [:edit, :index, :new, :create, :update, :destroy]
  end

  resources :conversations, only: [:index, :create, :destroy] do
    resources :messages, only: [:new, :create]
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
