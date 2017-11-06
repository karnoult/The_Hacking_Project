Rails.application.routes.draw do

  root 'users#index'

  resources 'users', only: [:show, :index, :new, :create]

  resources 'events', only: [:show, :index, :new, :create]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
