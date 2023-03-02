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
i = 1
10.times {
  User.create!(
    email: "user#{i}@gmail.com",
    password: "password"
  )
  i += 1
}
puts "OK ! (user1@gmail.com -> user10@gmail.com, password = 'password' partout)"

print "Seeding Planets..."

15.times {
  file = URI.open("https://res.cloudinary.com/dx1sso7tq/image/upload/#{PLANETS.sample}")
  planet = Planet.new(
    name: Faker::Space.star + ' ' + SUFFIX.sample,
    planet_type: TYPE.sample,
    description: Faker::Lorem.paragraphs(number: 5),
    price_per_night: Faker::Number.between(from: 25, to: 2000),
    rating: Faker::Number.between(from: 1, to: 5),
    user_id: Faker::Number.between(from: 1, to: 10),
    population: Faker::Number.between(from: 200_000, to: 950_000)
  )
  planet.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpg")
  planet.save!
}

puts "OK !"

print "Seeding Bookings..."

number = 1
10.times {
  booking = Reservation.new(
    start_date: Faker::Date.between(from: "2023-0#{number}-01", to: "2023-0#{number}-31"),
    end_date: Faker::Date.between(from: start_date, to: "2023-0#{number}-31"),
    planet_id: sample([4, 5, 6, 11]),
    user_id: 10
  )
  booking.save!
  number += 1
}
puts "OK !"
