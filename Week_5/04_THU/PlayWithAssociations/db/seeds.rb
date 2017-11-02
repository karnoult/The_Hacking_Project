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

a = Assembly.create(name: "toto")
p = Part.create(part_number: 1234)
a.parts << p

u = User.create(name:"uouo")
c = Category.create(name:"coco")
v = Video.create(name:"vovo", category:c, user:u)
u.categories << c

user1 = Twitter.create(name:"user1")
user2 = Twitter.create(name:"user2")
tweet1 = Tweet.create(content:"twetwe", author:user1)
tweet1.likers << user2
msg1 = Message.create(content:"toto", sender:user1)
msg1.recipients << user2
user1.followers << user2
