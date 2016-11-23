Rails.application.routes.draw do
  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'
  resources :posts
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
