Rails.application.routes.draw do

  # get 'sessions/new'

  # get 'pages/home'
  # get 'users/new'
  resources :users#, only: [:new, :create]
  resources :sessions #, only: [:new, :create, :destroy]

  root  'pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin' , to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'get'
end
