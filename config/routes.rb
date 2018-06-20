# Rails.application.routes.draw do
#   get 'admin/index'

#   get 'sessions/new'

#   get 'sessions/create'

#   get 'sessions/destroy'

#   resources :users
#   resources :orders
#   resources :line_items
#   resources :carts
#   get 'store/index'

#   resources :products
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   root 'store#index', as: 'store'
# end





Depot::Application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
  get 'login' => :new
  post 'login' => :create
  delete 'logout' => :destroy
end

  get "sessions/create"
  get "sessions/destroy"
  resources :users
  resources :orders
  resources :line_items
  resources :carts
  get "store/index"

  resources :products do
    get :who_bought, on: :member
  end

  namespace :admin do
    resources :reports, only: :index
    resources :categories, only: :index
  end

# get '/users/orders', to: 'users#orders'

# The priority is based upon order of creation:
# first created -> highest priority.
# See how all your routes lay out with "rake routes".
# You can have the root of your site routed with "root"
root 'store#index', as: 'store'
# ...
end
