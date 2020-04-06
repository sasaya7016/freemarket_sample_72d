Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  resources :items do
    collection do
  get 'purchase/:id', to: 'items#purchase', as: 'purchase'
  post 'buy/:id'=>   'items#buy', as: 'buy'#httpメソッドはpostなので注意
  get  'done'=>      'items#done', as: 'done'
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
