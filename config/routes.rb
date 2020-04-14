Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  resources :items do
    collection do
      get :get_category_children, defaults: { format: 'json' }
      get :get_category_grandchildren, defaults: { format: 'json' }
      get :get_item_size, defaults: { format: 'json' }
      get :get_item_fee, defaults: { format: 'json' }
      get :category_index
    end
    member do
      get :buy
    end
  end
  resources :credit_cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
