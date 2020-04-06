Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  #view表示のため仮でresourceと指定しています
  resources :users do
    member do
      get :profile
      get :address
      get :logout
      get :support
      scope :support do
          get :registration_support
          get :defect_support
          get :trouble_support
          get :request_support
          get :evaluation_support
          get :buy_support
          get :withdraw_support
          get :other_support
      end
    end
  end
  resources :items
  resources :credit_cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
