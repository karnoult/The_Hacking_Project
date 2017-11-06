# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.destroy_all
Flight.destroy_all

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

all_airports = Airport.all
nb_airports = airports.size

1000.times do |n|
  Flight.create(
    duration: rand(30..600),
    departure_date: rand(7.days).seconds.from_now,
    departure_airport: all_airports[rand(1..nb_airports) - 1],
    arrival_airport: all_airports[rand(1..nb_airports) - 1]
  )
end
