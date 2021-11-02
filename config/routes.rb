Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'welcome/index'
  root to: "welcome#index"
  devise_for :users, controllers: { registrations: 'devise/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :carts
  resources :orders
  namespace :admin do
    resources :products do
      member do
        post :active
      end
    end
  end
end
