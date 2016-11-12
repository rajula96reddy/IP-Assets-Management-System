Rails.application.routes.draw do
  resources :ip_assets
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
