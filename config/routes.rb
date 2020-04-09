Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resources :items do
    collection do
      get :get_category_children, defaults: { format: 'json' }
      get :get_category_grandchildren, defaults: { format: 'json' }
      get :get_item_size, defaults: { format: 'json' }
      get :get_toppage_category, defaults: { format: 'json' }
      get :category_index
    end
    member do
      get :buy
    end
  end
  resources :credit_cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
