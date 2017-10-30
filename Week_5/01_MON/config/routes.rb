Rails.application.routes.draw do
  root to: 'welcome#home'

  get '/secret_page', to: 'welcome#secret_page'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources 'users'
end
