Rails.application.routes.draw do

  devise_for :users
  resources :items, path: "photo-de-chat"
  resources :carts,only: [:show, :update, :destroy], path: "mon-panier"
  resources :orders, only: [:index, :create], path: "paiement"
  
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end