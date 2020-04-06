Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  #view表示のため仮でresourceと指定しています
  resource :users do
    collection do
      get :support
      scope :support do
          get :contact
          get :withdraw
          get :adress
          get :registration_enquiry
          get :defect_enquiry
          get :trouble_enquiry
          get :request_enquiry
          get :evaluation_enquiry
          get :buy_enquiry
          get :withdraw_enquiry
          get :other_enquiry
      end
    end
  end
  resources :items
  resources :credit_cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
