Rails.application.routes.draw do
  root to: 'movies#index', as: 'home'
end
