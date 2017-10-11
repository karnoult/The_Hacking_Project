#!/usr/bin/env ruby

require "twitter"

client_stream = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "XYTYYk9GZrFQ5w3HMzQOsCmoL"
  config.consumer_secret     = ENV['twitter_consumer_secret']
  config.access_token        = "918055468798566400-rsUOtTB8akwmqSRVES462XASbTwgoFP"
  config.access_token_secret = ENV['twitter_access_token_secret']
end

client_rest = Twitter::REST::Client.new do |config|
  config.consumer_key        = "XYTYYk9GZrFQ5w3HMzQOsCmoL"
  config.consumer_secret     = ENV['twitter_consumer_secret']
  config.access_token        = "918055468798566400-rsUOtTB8akwmqSRVES462XASbTwgoFP"
  config.access_token_secret = ENV['twitter_access_token_secret']
end


def search_twitter(term, options, client_rest)
  client_rest.search(term, options).take(10).each do |tweet|
  if tweet.is_a?(Twitter::Tweet)
    puts tweet.text
  end
end
end

def filter_twitter(options, client_stream, client_rest)
  client_stream.filter(options) do |tweet|
    if tweet.is_a?(Twitter::Tweet) && !tweet.text.start_with?("RT ")

      begin
        puts tweet.text
        client_rest.retweet!(tweet)
        #client_rest.update("hello @#{tweet.user.screen_name}, tu peux manger pas cher avec mon code promo UberEats : xnbhu")
        client_rest.favorite([tweet])
        client_rest.follow([tweet.user])
      rescue Twitter::Error::Unauthorized
        puts "This one has already been treated"
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
  result_type: "recent",
  geocode: "48.8566667,2.3509871,10mi"
}

#search_twitter("faim", search_options, client_rest)
filter_twitter(filter_options, client_stream, client_rest)
