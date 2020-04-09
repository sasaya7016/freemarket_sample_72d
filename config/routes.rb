Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  resources :items do
    member do
      get 'buy', to: 'items#buy'
      post 'pay', to: 'items#pay'
      get  'done', to: 'items#done'
      get :buy
    end
    collection do
      get :get_category_children, defaults: { format: 'json' }
      get :get_category_grandchildren, defaults: { format: 'json' }
      get :get_item_size, defaults: { format: 'json' }
      get :category_index
    end
  end
  resources :credit_cards, only: [:new,:show] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end
end