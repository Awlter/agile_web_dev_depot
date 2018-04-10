Rails.application.routes.draw do
  resources :users
  resources :line_items
  resources :carts
  root 'store#index', as: "store_index"

  resources :products do
    get :who_bought, on: :member
  end
  resources :orders, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
