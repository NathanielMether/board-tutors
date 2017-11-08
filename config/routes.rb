Rails.application.routes.draw do
  get 'menu/index'

  get 'contacts' => 'contacts#index'

  get '/support' => 'support#new'
  post '/support' => 'support#create'

  root "home#index"

  resources :profiles do
    resources :bookings
    resources :reviews
  end

  resources :conversations do
    resources :messages
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
