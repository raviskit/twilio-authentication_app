Rails.application.routes.draw do

  devise_scope :user do
     get '/user_profile', :to => 'registrations#show'
   end
  post 'payments/verify' => "payments#verify"
  resource :cart, only: [:show]
  resources :payments, only: [:new, :create]
  resources :order_items, only: [:create, :update, :destroy], format: :js
  resources :products do
    collection do
      get "order_history"
    end
  end
  resources :categories
  devise_for :users , :controllers => { registrations: 'registrations' }

  root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
