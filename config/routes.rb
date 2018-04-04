Rails.application.routes.draw do
  get 'admins/index'

  get 'users/index'

  get 'users/show'

  resources :carts
  resources :products
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
