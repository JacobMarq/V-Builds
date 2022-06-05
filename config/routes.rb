Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :component_type_specification_options
      resources :component_inventories
      resources :cart_items
      resources :shopping_sessions
      resources :user_builds
      resources :order_items
      resources :build_components
      resources :builds
      resources :discounts
      resources :components
      resources :type_specifications
      resources :types
      resources :specification_options
      resources :specifications
      resources :options
      resources :orders
      resources :typical_usages
      devise_for :users
      post '/create-payment-intent', to: 'payment_intents#create'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
