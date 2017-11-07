Rails.application.routes.draw do
  root 'gossips#index'
  devise_for :users
end
