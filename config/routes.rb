Rails.application.routes.draw do

  devise_for :users
  resources :items
  resources :carts, only: [:show, :update, :destroy]
  resources :orders, only: [:index, :create]
  resources :profile
  
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
