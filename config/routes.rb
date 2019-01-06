Rails.application.routes.draw do

  # get 'sessions/new'

  # get 'pages/home'
  # get 'users/new'
  resources :users#, only: [:new, :create]
  resources :sessions #, only: [:new, :create, :destroy]
  resources :items
  root  'pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin' , to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'get'
  match '/electronics', to: 'items#electronics', as: 'electronics',via: 'get'
  match '/mobiles', to: 'items#mobiles', as: 'mobiles',via: 'get'
  match '/vehicles', to: 'items#vehicles', as: 'vehicles',via: 'get'
  match '/title', to: 'items#title', as: 'title',via: 'get'
  match '/price', to: 'items#price', as: 'price',via: 'get'

end
