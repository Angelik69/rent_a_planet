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
  'javier-miranda-Jn2EaLLYZfY-unsplash_qreutx.jpg',
  'simon-lee-XnGxTBij48Q-unsplash_sh5fjn.jpg',
  'nasa-vhSz50AaFAs-unsplash_ywgdn6.jpg',
  'nasa-N3BQHYOVq5E-unsplash_sknojo.jpg',
  'andrew-russian-UuVkBMbNSlM-unsplash_n2f4oh.jpg',
  'neven-krcmarek-9dTg44Qhx1Q-unsplash_w3hqlt.jpg',
  'planet-volumes-awYEQyYdHVE-unsplash_z09hdg.jpg',
  'nasa-ScBkW9AKgcA-unsplash_hggply.jpg',
  'nasa-2W-QWAC0mzI-unsplash_ew0g74.jpg'
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
  file = URI.open("https://res.cloudinary.com/dx1sso7tq/image/upload/v1677577268/#{PLANETS.sample}")
  planet = Planet.new(
    name: Faker::Space.star + ' ' + SUFFIX.sample,
    planet_type: TYPE.sample,
    description: Faker::Lorem.paragraphs(number: 5),
    price_per_night: Faker::Number.between(from: 25, to: 2000),
    rating: Faker::Number.between(from: 1, to: 5),
    user_id: Faker::Number.between(from: 1, to: 10),
    population: Faker::Number.between(from: 200_000, to: 950_000)
  )
  planet.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  planet.save!
}

puts "OK !"
