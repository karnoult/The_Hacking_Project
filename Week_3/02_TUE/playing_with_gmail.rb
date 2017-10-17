require 'gmail'
require 'google_drive'
require_relative 'TownhallsRetriever'
require 'pry'

# send townhalls name and email (scraping) to Google Drive
def send_townhalls_info_to_drive
  # creates a Google Drive API session
  my_session = GoogleDrive::Session.from_config("config.json")

  # retrieves spreadsheet
  my_spreadsheet = my_session.spreadsheet_by_title("Townhalls_Info")

  # creates a new spreadsheet if it doesn't exist already
  my_spreadsheet = my_session.create_spreadsheet("Townhalls_Info") if !my_spreadsheet

  # get the first worksheet and (re)name it
  my_worksheet = my_spreadsheet.worksheets[0]
  my_worksheet.title = "Townhalls"

  # retrieves townhalls info and writes those into the worksheet
  i = 1
  TownhallsRetriever.new.townhalls_info("http://annuaire-des-mairies.com/drome.html").each do |townhall_name, townhall_email|
    my_worksheet[i, 1] = townhall_name
    my_worksheet[i, 2] = townhall_email
    i += 1
  end
  TownhallsRetriever.new.townhalls_info("http://annuaire-des-mairies.com/drome-2.html").each do |townhall_name, townhall_email|
    my_worksheet[i, 1] = townhall_name
    my_worksheet[i, 2] = townhall_email
    i += 1
  end

  # saves the worksheet
  my_worksheet.save
end

# connect to Google Drive and get townhalls_info
# returns: hash {"townhall name": "townhall email"}
def get_townhalls_info_from_drive
  townhalls = {}

  my_session = GoogleDrive::Session.from_config("config.json")
  my_spreadsheet = my_session.spreadsheet_by_title("Townhalls_Info")
  my_worksheet = my_spreadsheet.worksheets[0]

  (1..my_worksheet.num_rows).each do |row|
    townhalls[my_worksheet[row, 1]] = my_worksheet[row, 2]
  end

  return townhalls
end

# send email to townhall
# input: townhall name and email
def send_email_to_townhall(townhall_name, townhall_email)
  email_content = write_nice_email(townhall_name)

  Gmail.connect!("yesouiskevin@gmail.com", ENV["gm"]) do |gmail|
    gmail.deliver do
      to townhall_email
      subject "Formation The Hacking Project à #{townhall_name} !"
      text_part do
       body email_content[:text_part]
      end
      html_part do
        content_type 'text/html; charset=UTF-8'
        body email_content[:html_part]
      end
      reply_to "charles@thehackingproject.org"
    end
  end
end

# returns an hash with text_part and html_part
def write_nice_email(townhall_name)
  email_content = {}

  email_content[:text_part] = "Bonjour,
  Email envoyé automatiquement par un moussaillon de The Hacking Project : http://thehackingproject.org/
  Pour accueillir cette formation dans votre ville, Charles, co-fondateur de The Hacking Project, pourra répondre à toutes vos questions : 06.95.46.60.80
  Bien à vous,
  Kévin"

  email_content[:html_part] = "Bonjour,<br />
  <br />
  Je m'appelle Kévin et je suis élève en développement Web.<br />
  <br />
  La formation est gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau.<br />
  La formation s'appelle <strong>The Hacking Project</strong> (http://thehackingproject.org/).
  Nous apprenons l'informatique via la méthode du peer-learning : des projets concrets qui nous sont assignés tous les jours, sur lesquels nous planchons en petites équipes autonomes.<br />
  <br />
  Le projet du jour est d'envoyer (via un programme développé en <a href=\"https://www.ruby-lang.org/fr/\">Ruby</a>) des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.<br />
  Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{townhall_name}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées.
  Le modèle d'éducation de <strong>The Hacking Project</strong> n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec #{townhall_name} !<br />
  <br />
  Charles, co-fondateur de <strong>The Hacking Project</strong>, pourra répondre à toutes vos questions : 06.95.46.60.80<br />
  <br />
  Bien à vous,<br />
  Kévin"

  return email_content
end

#send_townhalls_info_to_drive
get_townhalls_info_from_drive.each do |townhall_name, townhall_email|
  send_email_to_townhall(townhall_name, townhall_email)
end
