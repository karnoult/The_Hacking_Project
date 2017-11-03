Rails.application.routes.draw do

  root 'users#index'

  resources 'events', only: [:show, :index, :new, :create]

  resources 'users', only: [:show, :index, :new, :create]

end
