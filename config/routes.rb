Rails.application.routes.draw do

  root 'articles#index'

  resources :articles
  resources :categories, only: [:show]

  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :pages, only: [:show]
end
