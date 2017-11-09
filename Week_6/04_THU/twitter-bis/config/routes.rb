Rails.application.routes.draw do
  root 'twitter_bot#index'

  patch '/', to: 'twitter_bot#send_tweet'
end
