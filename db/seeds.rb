# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'

PLANETS = [
  'v1677679375/terre_qptt3p.jpg',
  'v1677679375/sun_w4lqjb.jpg',
  'v1677679375/uranus_iphcpn.jpg',
  'v1677679374/saturne_ur63za.jpg',
  'v1677679374/jupiter_ko6yln.jpg',
  'v1677679374/neptune_tsq3wo.jpg',
  'v1677679374/mars_ohgpww.jpg',
  'v1677679374/mercure_nuwnfw.jpg',
  'v1677679374/lune_piu1pu.jpg'
]

TYPE = %w[rocheuse tellurique gazeuse oceanique]

SUFFIX = %w[I II III IV V VI VII VIII IX X XI XII XIII XIV XV XVI XVII XVIII XIX XX]

print "Seeding Users..."

user = User.new(
  email: 'toto.palpatine@empire.com',
  password: 'password'
)
file = URI.open("https://res.cloudinary.com/dx1sso7tq/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1677830430/palpatine_g7svaw.jpg")
user.avatar.attach(io: file, filename: "palp.jpg", content_type: "image/jpg")
user.save!

user = User.new(
  email: 'david_vador@gmail.com',
  password: 'password'
)
file = URI.open("https://res.cloudinary.com/dx1sso7tq/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1677830430/dv_sr685d.webp")
user.avatar.attach(io: file, filename: "vador.jpg", content_type: "image/jpg")
user.save!

user = User.new(
  email: 'kren@free.fr',
  password: 'password'
)
file = URI.open("https://res.cloudinary.com/dx1sso7tq/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1677830430/kr_uxtrvo.jpg")
user.avatar.attach(io: file, filename: "kylo.jpg", content_type: "image/jpg")
user.save!

puts "OK !"

# print "Seeding Users..."
# i = 1
# 5.times {
#   User.create!(
#     email: "user#{i}@gmail.com",
#     password: "password"
#   )
#   i += 1
# }
# puts "OK ! (user1@gmail.com -> user5@gmail.com, password = 'password' partout)"

print "Seeding Planets..."

10.times {
  file = URI.open("https://res.cloudinary.com/dx1sso7tq/image/upload/#{PLANETS.sample}")
  planet = Planet.new(
    name: Faker::Space.star + ' ' + SUFFIX.sample,
    planet_type: TYPE.sample,
    description: Faker::Lorem.paragraphs(number: 5),
    price_per_night: rand(50..2000),
    rating: rand(1..5),
    user_id: rand(1..3),
    population: rand(200_000..950_000)
  )
  planet.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
  planet.save!
}

puts "OK !"

print "Seeding Reservations..."

10.times {
  date = Date.today
  booking = Reservation.new(
    start_date: date + (rand * 21),
    nb_persons: rand(1..5),
    planet_id: rand(1..10),
    user_id: rand(1..3)
  )
  booking.end_date = booking.start_date + rand(3..7)
  booking.save!
}
puts "OK !"
