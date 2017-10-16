require 'csv'
require 'json'
require_relative 'TownhallsRetriever'

HEADERS = [
  'townhall name',
  'townhall email'
]

# retrieves townhalls info and writes those into a JSON file
json_file = File.new("townhalls.json", "w+")
json_file.write(JSON.generate(TownhallsRetriever.new.townhalls_info))
json_file.close

# converts the JSON file into a CSV file
File.open("townhalls.json") do |json|
  CSV.open("townhalls.csv", "wb", :headers => HEADERS, :write_headers => true) do |csv|
    JSON.parse(json.read).each do |townhall|
      csv << townhall
    end
  end
end
