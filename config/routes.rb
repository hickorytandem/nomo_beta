Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :orders, only: [:index, :new, :create, :update, :show, :destroy] do
      get "checkout", to: 'orders#edit',as: :checkout
  end
  resources :restaurants, only: [:new, :create]
  resources :ingredients
  get "my_cart", to: 'orders#new'
  # post "my_cart", to: 'orders#create'
  # get "checkout", to: 'orders#edit',as: :checkout
  get "my_cart/success", to: 'orders#success'
  # Restaurant routes
  get "my_ingredients", to: 'ingredients#my_ingredients'
  get "my_orders", to: 'orders#my_orders'
  get "dashboard", to: 'restaurants#dashboard'
  get "shop_settings", to: 'restaurants#settings'

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
