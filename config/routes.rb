Rails.application.routes.draw do
  devise_for :users
  resources :companies do
    resources :cash_managements, except: [:index, :show]
  end
  resources :users, only: [:edit, :update, :index]
  root 'companies#index'
end
