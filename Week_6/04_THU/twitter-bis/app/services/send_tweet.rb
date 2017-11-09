# use twitter gem
require 'twitter'

class SendTweet

  def initialize(tweet_content)
    @tweet_content = tweet_content
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'XYTYYk9GZrFQ5w3HMzQOsCmoL'
      config.consumer_secret     = ENV['twitter_consumer_secret']
      config.access_token        = '918055468798566400-rsUOtTB8akwmqSRVES462XASbTwgoFP'
      config.access_token_secret = ENV['twitter_access_token_secret']
    end
  end

  def perform
    @client.update(@tweet_content)
  end
end
