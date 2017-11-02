# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

d = Doctor.create(first_name: "toto", last_name: "toto", specialty: "toto", postal_code: 75011)
p = Patient.create(first_name: "coco", last_name: "coco")
Appointment.create(date: DateTime.now, doctor: d, patient: p)
