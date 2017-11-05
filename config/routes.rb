Rails.application.routes.draw do

  get 'home/index'

  root "home#index"

  resources :profiles do
    resources :reviews
  end

  resources :conversations do
    resources :messages
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
