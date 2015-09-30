Rails.application.routes.draw do

  resources :articles
  root 'articles#index'
  
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :pages, only: [:show]


end
