Rails.application.routes.draw do
 
  get 'users/new'

  resources :articles
  root 'articles#index'
  
end
