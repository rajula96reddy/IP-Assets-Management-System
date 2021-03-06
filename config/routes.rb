Rails.application.routes.draw do
  resources :contact_us
  resources :notifications
  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'
  resources :posts do
    resources :comments
  end
  resources :ownerships
  resources :ip_assets do
    collection do
      get:'new_index'
      get:'my_index'
      put:'share_royalty'
      get:'edit_request'
      get:'delete_request'     
      get:'set_approved'
      get:'edit_asset'
      get:'delete_asset'
      get:'set_edit'
      get:'set_delete'
      get:'set_not_edit'
      get:'set_not_delete'
      get:'all_index'
      get:'not_index'
    end
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users do
    collection do
      get:'new_index'
    end
  end
end
