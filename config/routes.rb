Rails.application.routes.draw do

  get 'home/index'

  root "home#index"

  resources :profiles do
    resources :reviews
  end

  resources :messages
  resources :conversations

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
