Rails.application.routes.draw do

  root 'pages#home'
  get 'pages/portfolio'
  get 'pages/crm'
  get 'pages/ed_digital'
  get 'pages/actualize'
  resources :articles do
  	resources :comments
  end

  resources :categories, only: [:show]

  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :messages, only: [:new, :create]

end
