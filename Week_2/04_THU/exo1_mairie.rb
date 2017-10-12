require 'rubygems'
require 'nokogiri'
require 'pry'
require 'open-uri'
require 'rest-client'

# return the townhall email adress from its annuaire-des-mairies.com url
def get_info_townhall_from_webpage(url_townhall)
  email_townhall = ""
  page_townhall = Nokogiri::HTML(open(url_townhall))

  # get email
  page_townhall.xpath("//p[@class=\"Style22\"]").each do |node|
    node_content = node.text
    if node_content.include? "@"
    #if node_content =~ /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
      email_townhall = node_content[1, node_content.size]
    end
  end

  # get city name
  h1_content = page_townhall.xpath("//h1")[0].text
  name_townhall = h1_content["Commune de ".size, h1_content.size]

  return { :name => name_townhall, :email=> email_townhall }
end

# return all city URLs of a department page from annuaire-des-mairies.com
def get_townhalls_urls(url_department)

  list_townhall_urls = []

  page_department = Nokogiri::HTML(open(url_department))

  page_department.xpath("//a[@class=\"lientxt\"]").each do |node|
    list_townhall_urls << "http://annuaire-des-mairies.com/" + node[:href][1, node[:href].size - 1]
    #list_urls << { city: node.text, url:  node[:href]}
  end

  return list_townhall_urls
end

url_department = "http://annuaire-des-mairies.com/val-d-oise.html"
townhall_list = []

get_townhalls_urls(url_department).each do |url_townhall|
  info_townhall = get_info_townhall_from_webpage(url_townhall)
  if info_townhall[:email] != ""
    townhall_list << info_townhall
  end
end

# display my list of city and email
townhall_list.each do |townhall|
  puts townhall[:name].to_s + " (" + townhall[:email].to_s + ")"
end
