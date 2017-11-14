Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users
end
