require 'rubygems'
require 'nokogiri'
require 'pry'
require 'open-uri'
require 'rest-client'

def get_incubateur_info(url_incubateur)

  name_incubateur = ""
  website_incubateur = ""
  address_incubateur = ""

  Nokogiri::HTML(open(url_incubateur)).xpath("//div[@class=\"wpb_wrapper\"]//span").each do |info|
    if info.text.include? "Structure :"
      name_incubateur = info.text
    elsif info.text.include? "Site Internet :"
      website_incubateur = info.text
    elsif info.text.include? "Adresse :"
      address_incubateur = info.text
    end
  end

  return { name: name_incubateur,  website: website_incubateur, address: address_incubateur }

end

def get_incubateur_urls(url)

  list_incubateur_urls = []

  nb_departments = 23

  Nokogiri::HTML(open(url)).xpath("//div[@class=\"wpb_wrapper\"]//a").each do |node_department|
    if node_department[:href].include? "liste-incubateurs-start-ups-"
      nb_departments -= 1
      Nokogiri::HTML(open(node_department[:href])).xpath("//div[@class=\"wpb_wrapper\"]//a").each do |node_incubateur|
        if node_incubateur[:href].include? "interview"
          list_incubateur_urls << node_incubateur[:href]
        end
      end
    end

    return list_incubateur_urls if nb_departments == 21
  end

end

url = "http://www.alloweb.org/incubateurs-startups/les-incubateurs-de-start-ups-en-france/"
incubateurs_list = []

get_incubateur_urls(url).each do |url_incubateur|
  incubateurs_list << get_incubateur_info(url_incubateur)
end

incubateurs_list.each do |incubateur|
  puts incubateur[:name].to_s
  puts incubateur[:website].to_s
  puts incubateur[:address].to_s
  puts "------------------------------------"
end

