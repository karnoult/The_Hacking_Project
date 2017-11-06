# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ua = User.create(name: "Alex", password: "toto", password_confirmation: "toto")
ub = User.create(name: "Brice", password: "toto", password_confirmation: "toto")
ud = User.create(name: "Duy", password: "toto", password_confirmation: "toto")
uj = User.create(name: "Juliette", password: "toto", password_confirmation: "toto")
uk = User.create(name: "Kévain", password: "toto", password_confirmation: "toto")
un = User.create(name: "Naula", password: "toto", password_confirmation: "toto")

Event.create(desc: "Ruby", place: "Paris", date: "2017-11-15", creator: ua)
Event.create(desc: "Rails", place: "Tours", date: "2017-11-12", creator: ub)
Event.create(desc: "Cuisine éthiopienne", place: "Tours", date: "2017-11-15", creator: ua)
Event.create(desc: "Tennis pour les nuls", place: "Vincennes", date: "2017-11-15", creator: uk)
Event.create(desc: "Hack ton tennis#", place: "Paris", date: "2017-11-15", creator: uk)
Event.create(desc: "jQuery 101", place: "Paris", date: "2017-11-15", creator: uk)

