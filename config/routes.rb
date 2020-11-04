Rails.application.routes.draw do
  devise_for :users
  resources :companies
  resources :users, only: [:edit, :update]
  root 'companies#index'
end
