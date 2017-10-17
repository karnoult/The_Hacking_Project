require 'nokogiri'
require 'open-uri'

class TownhallsRetriever

  # return the townhall email address from its annuaire-des-mairies.com url
  def get_email_townhall_from_webpage(url_townhall)
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

    return email_townhall
  end

  # return all city URLs of a department page from annuaire-des-mairies.com
  def get_townhalls_urls(url_department)

    list_info_townhall = []

    page_department = Nokogiri::HTML(open(url_department))

    page_department.xpath("//a[@class=\"lientxt\"]").each do |node|
      list_info_townhall << { name: node.text, url:  "http://annuaire-des-mairies.com/" + node[:href][1, node[:href].size - 1]}
    end

    return list_info_townhall
  end

  # returns townhall name + email in a hash {name_townhall: email_townhall}
  def townhalls_info(url_department)
    townhalls = {}

    get_townhalls_urls(url_department).each do |info_townhall|
      email_townhall = get_email_townhall_from_webpage(info_townhall[:url])
      if email_townhall != ""
        townhalls[info_townhall[:name]] = email_townhall
      end
    end

    return townhalls
  end
end
