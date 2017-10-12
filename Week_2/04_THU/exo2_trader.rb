require 'rubygems'
require 'nokogiri'
require 'pry'
require 'open-uri'
require 'rest-client'

def get_crypto_and_price

  page_coinmarketcap = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

  list_crypto_and_price = []

  time = Time.now.to_s

  page_coinmarketcap.xpath("//a[@class=\"price\"]").each do |node|
    list_crypto_and_price << {
      time: time,
      name: node[:href].split("/")[2],
      price: node.text
    }
  end

  return list_crypto_and_price

end

i = 1

loop {
  get_crypto_and_price.each do |crypto_and_price|
    puts crypto_and_price[:time] + " > " + crypto_and_price[:name].to_s + " (" + crypto_and_price[:price].to_s + ")"
  end

  # let's sleep for 10 seconds (would be 3600 for an hour)
  sleep(10)

  # let's exit after 5 times (would be 24 for a day if using sleep(3600) above)
  exit if i == 5

  i += 1

}
