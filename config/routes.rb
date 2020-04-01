Rails.application.routes.draw do
  root 'items#index'
  resources :users
  resources :items
  resources :credit_cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end