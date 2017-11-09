Rails.application.routes.draw do
  root 'twitter_bot#index'

  post '/', to: 'twitter_bot#send_tweet'
end
