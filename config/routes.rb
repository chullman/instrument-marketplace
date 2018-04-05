Rails.application.routes.draw do

  resources :carts
  resources :products
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: "products#index"

  get '/admins/edit_permissions', to: 'admins#edit_permissions', as: 'edit_permissions'
  put '/admins/edit_permissions/:id', to: 'admins#update_permissions', as: 'update_permissions'

  get '/admins/edit_enablement', to: 'admins#edit_enablement', as: 'edit_enablement'
  put '/admins/update_enablement/:id', to: 'admins#update_enablement', as: 'update_enablement'

  get '/admins/edit_user_deletion', to: 'admins#edit_user_deletion', as: 'edit_user_deletion'
  delete '/admins/destroy_user/:id', to: 'admins#destroy_user', as: 'destroy_user'

  post '/carts/add_to_cart/:id', to: 'carts#add_to_cart', as: 'add_to_cart'

  get ':controller(/:action)'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
