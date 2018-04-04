Rails.application.routes.draw do

  resources :carts
  resources :products
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  root to: "products#index"

  get '/admins/edit_permissions', to: 'admins#edit_permissions', as: 'edit_permissions'
  put '/admins/edit_permissions/:id', to: 'admins#update_permissions', as: 'update_permissions'

  get ':controller(/:action)' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
