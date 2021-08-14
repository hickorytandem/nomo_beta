Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :orders, only: [:index, :new, :create, :update]
  resources :ingredients
  get "my_cart", to: 'orders#new'
  post "my_cart", to: 'orders#create'
  get "my_cart/success", to: 'orders#success'


end
