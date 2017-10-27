Rails.application.routes.draw do

  root to: 'static_pages#home', as: 'home'

  get 'about(/:id)', to: 'static_pages#about', as: 'about'

end
