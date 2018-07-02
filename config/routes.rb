Depot::Application.routes.draw do

 constraints user_agent: /Firefox/ do
    root 'store#index'
    match '*url', to: redirect('/'), via: :all
  end

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

  resources :products, path: 'books'

  resources :ratings, only: [:create]

  get "my-order", to: 'users#orders'
  get "my-items", to: 'users#items'

  namespace :admin do
    resources :reports, only: [:index]
    resources :categories, only: [:index] do
      get "books", on: :member
      get 'books', to: redirect('/')
    end
  end
  # get "categories/:id/books", to: 'categories#books'

# get '/users/orders', to: 'users#orders'

# The priority is based upon order of creation:
# first created -> highest priority.
# See how all your routes lay out with "rake routes".
# You can have the root of your site routed with "root"
root 'store#index', as: 'store'
# ...
end
