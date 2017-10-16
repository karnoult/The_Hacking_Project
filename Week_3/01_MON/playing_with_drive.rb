require 'google_drive'
require_relative 'TownhallsRetriever'

# creates a Google Drive API session
my_session = GoogleDrive::Session.from_config("config.json")

# retrieves spreadsheet
my_spreadsheet = my_session.spreadsheet_by_title("Ruby_Drive")

# creates a new spreadsheet if it doesn't exist already
my_spreadsheet = my_session.create_spreadsheet("Ruby_Drive") if !my_spreadsheet

# get the first worksheet and (re)name it
my_worksheet = my_spreadsheet.worksheets[0]
my_worksheet.title = "Townhalls"

# retrieves townhalls info and writes those into the worksheet
i = 1
TownhallsRetriever.new.townhalls_info.each do |townhall_name, townhall_email|
  my_worksheet[i, 1] = townhall_name
  my_worksheet[i, 2] = townhall_email
  i += 1
end

# saves the worksheet
my_worksheet.save
