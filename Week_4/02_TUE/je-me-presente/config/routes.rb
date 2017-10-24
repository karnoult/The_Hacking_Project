Rails.application.routes.draw do

  root to: 'static_pages#home', as: 'home'

  get 'contact', to: 'static_pages#contact', as: 'contact'

  get 'about(/:id)', to: 'static_pages#about', as: 'about'

  get 'toi', to: 'static_pages#toi', as: 'toi'
  get 'binome', to: 'static_pages#binome', as: 'binome'

end
