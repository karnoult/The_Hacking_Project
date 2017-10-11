#!/usr/bin/env ruby

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

def search_twitter(term, options, nb_results)
  begin
    $client_rest.search(term, options).take(nb_results).each do |tweet|
      if tweet.is_a?(Twitter::Tweet)
        puts tweet.text
        #puts $client_rest.rate_limit.to_s
        spam(tweet)
      end
    end
  rescue Twitter::Error >> e
    puts ">>> This tweet has already been treated: " + e.to_s
  end
end

def filter_twitter(options)
  begin
    $client_stream.filter(options) do |tweet|
      if tweet.is_a?(Twitter::Tweet) && !tweet.text.start_with?("RT ")
        puts tweet.text
        spam(tweet)
      end
    end
  rescue Twitter::Error => e
    puts ">>> Exception Class: #{ e.class.name }"
    puts ">>> Exception Message: #{ e.message }"
    puts ">>> Exception Backtrace: #{ e.backtrace }"
  end
end

search_options = {
  result_type: "recent",
  locations: "48.8566667,2.3509871,10mi"
}

filter_options = {
  result_type: "recent",
  locations: "48.8566667,2.3509871,10mi",
  track: "faim"
}

#search_twitter("faim", search_options, 100)
filter_twitter(filter_options)
