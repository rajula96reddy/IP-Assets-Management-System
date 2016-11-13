Rails.application.routes.draw do
  resources :not_approved_ip_assets
  resources :ip_assets do
  	collection do
  		get:copy
  	end
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
