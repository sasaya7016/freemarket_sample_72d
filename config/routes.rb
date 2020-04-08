Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  resources :items do
    collection do
  get 'buy/:id', to: 'items#buy'
  post 'pay/:id', to: 'items#pay'
  get  'done', to: 'items#done'
    end
  end
  resources :credit_cards, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end
end
