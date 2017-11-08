Rails.application.routes.draw do
  root 'moussaillons#index'
  resources :moussaillons
end
