require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users
  resources :companies do
    resources :cash_managements, except: [:index, :show]
  end
  resources :users, only: [:edit, :update, :index]
  root 'companies#index'
end
