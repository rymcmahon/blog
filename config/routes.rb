Rails.application.routes.draw do
 
  # get 'sessions/new'

  # get 'users/new'

  resources :articles
  root 'articles#index'
  
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
