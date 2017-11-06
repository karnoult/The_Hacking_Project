# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = [
  {airport_code: "CDG"},
  {airport_code: "ORL"},
  {airport_code: "DLX"},
  {airport_code: "XYZ"},
  {airport_code: "NTE"},
  {airport_code: "TOR"},
  {airport_code: "POI"},
  {airport_code: "TUI"},
  {airport_code: "LMS"}
]

Airport.create(airports)

random = Random.new
time_now = Time.now.to_i

1000.times do |n|
  Flight.create(
    duration: random.rand(600),
    # 2592000 = 60*60*24*30 = 30 jours en secondes
    departure_date: Time.at(time_now + Random.new.rand(2592000)),
    departure_airport: Airport.find(random.rand(airports.size - 1) + 1),
    arrival_airport: Airport.find(random.rand(airports.size - 1) + 1)
  )
end
