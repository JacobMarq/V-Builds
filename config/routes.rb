Rails.application.routes.draw do
  resources :component_inventories
  resources :cart_items
  resources :shopping_sessions
  resources :user_builds
  resources :order_items
  resources :build_components
  resources :builds
  resources :discounts
  resources :components
  resources :type_attributes
  resources :types
  resources :attribute_options
  resources :attributes
  resources :options
  resources :orders
  resources :payment_details
  resources :typical_build_usages
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
