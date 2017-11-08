Rails.application.routes.draw do
  root to: 'moussaillons#index'
  resources :moussaillons do
    resources :gossips, only: [:new, :create]
  end
  resources :gossips, only: [:show, :edit, :update, :destroy]
end
