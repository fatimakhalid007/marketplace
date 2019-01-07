Rails.application.routes.draw do

  # get 'sessions/new'

  # get 'pages/home'
  # get 'users/new'
  resources :users#, only: [:new, :create]
  resources :sessions #, only: [:new, :create, :destroy]
  resources :items

  resources :user_item

  # resources :items do
  # 	resources :user_item
  # end
  resources :user_item
  root  'pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin' , to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'get'
  match '/electronics', to: 'items#electronics', as: 'electronics',via: 'get'
  match '/mobiles', to: 'items#mobiles', as: 'mobiles',via: 'get'
  match '/vehicles', to: 'items#vehicles', as: 'vehicles',via: 'get'
  match '/title', to: 'items#title', as: 'title',via: 'get'
  match '/price', to: 'items#price', as: 'price',via: 'get'


  match '/search', to: 'pages#search', as: 'search', via:['get','post']
  
  
  match '/likes/:id', to: 'items#likes', as: 'like',via: ['get','post']
  match '/unlikes/:id', to: 'items#unlikes', as: 'unlike',via: ['get','post','delete']



end
