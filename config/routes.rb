Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  # exposes all routes explicitly
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :articles
end
