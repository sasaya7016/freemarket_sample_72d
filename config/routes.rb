Rails.application.routes.draw do
  devise_for :users
  root 'items#buy'
  resources :users
  resources :items
  resources :credit_cards do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
