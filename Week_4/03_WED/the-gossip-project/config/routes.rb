Rails.application.routes.draw do
  root 'gossips#index'
  # get 'gossips/index'
  resources :gossips
end
