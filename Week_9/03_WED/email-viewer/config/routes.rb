Rails.application.routes.draw do
  root 'emails#index'
  get 'show_content', to: 'emails#show_content'
end
