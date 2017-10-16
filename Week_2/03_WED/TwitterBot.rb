#!/usr/bin/env ruby

#use twitter gem
require "twitter"

$client_stream = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "XYTYYk9GZrFQ5w3HMzQOsCmoL"
  config.consumer_secret     = ENV['twitter_consumer_secret']
  config.access_token        = "918055468798566400-rsUOtTB8akwmqSRVES462XASbTwgoFP"
  config.access_token_secret = ENV['twitter_access_token_secret']
end

$client_rest = Twitter::REST::Client.new do |config|
  config.consumer_key        = "XYTYYk9GZrFQ5w3HMzQOsCmoL"
  config.consumer_secret     = ENV['twitter_consumer_secret']
  config.access_token        = "918055468798566400-rsUOtTB8akwmqSRVES462XASbTwgoFP"
  config.access_token_secret = ENV['twitter_access_token_secret']
end

class TwitterBot

  # retweet, fav tweet, and follow user
  def spam(tweet)
    begin
      $client_rest.retweet!(tweet)
      #$client_rest.update("hello @#{tweet.user.screen_name}, tu peux manger pas cher avec mon code promo UberEats : xnbhu")
      $client_rest.favorite!([tweet])
      $client_rest.follow!([tweet.user])
    rescue Twitter::Error
      puts ">>> This tweet has already been treated"
    end
  end

  # search the last [nb_results] tweets containing a specific [term] with the [options] applied
  def search_twitter(term, options, nb_results)
    $client_rest.search(term, options).take(nb_results).each do |tweet|
      if tweet.is_a?(Twitter::Tweet)
        puts tweet.text
        #spam(tweet)
      end
    end
  end

  # search the last [nb_results] tweets containing a specific [term] with the [options] applied
  def filter_twitter(options)
    $client_stream.filter(options) do |tweet|
      if tweet.is_a?(Twitter::Tweet)
        puts tweet.text
        #spam(tweet)
      end
    end
  end

end

search_options = {
  result_type: "recent",
  geocode: "48.8566667,2.3509871,10mi"
}

filter_options = {
  track: "faim",
  locations: "48.86,2.27,49.86,2.44"
}

my_bot = TwitterBot.new
my_bot.search_twitter("faim", search_options, 10)
#my_bot.filter_twitter(filter_options)
