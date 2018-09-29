Rails.application.routes.draw do

  root 'pages#home'
  get 'pages/portfolio'
  get 'pages/crm'
  get 'pages/ed_digital'
  get 'pages/actualize'
  get '/articles/1', to: redirect('http://www.ryanmcmahon.org/articles/1', status: 301)
  get '/articles/2', to: redirect('http://www.ryanmcmahon.org/articles/2', status: 301)
  get '/articles/3', to: redirect('http://www.ryanmcmahon.org/articles/3', status: 301)
  get '/articles/4', to: redirect('http://www.ryanmcmahon.org/articles/4', status: 301)
  get '/articles/5', to: redirect('http://www.ryanmcmahon.org/articles/5', status: 301)
  get '/articles/6', to: redirect('http://www.ryanmcmahon.org/articles/6', status: 301)
  get '/articles/7', to: redirect('http://www.ryanmcmahon.org/articles/7', status: 301)
  get '/articles/8', to: redirect('http://www.ryanmcmahon.org/articles/8', status: 301)
  get '/articles/9', to: redirect('http://www.ryanmcmahon.org/articles/9', status: 301)
  get '/articles/10', to: redirect('http://www.ryanmcmahon.org/articles/10', status: 301)
  get '/articles/11', to: redirect('http://www.ryanmcmahon.org/articles/11', status: 301)
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
