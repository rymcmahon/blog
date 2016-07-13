Rails.application.routes.draw do

  root 'pages#home'

  resources :articles do
  	resources :comments
  end

  resources :categories, only: [:show]

  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
end
