Rails.application.routes.draw do
  root 'gossips#index'
  resources :gossips
end
