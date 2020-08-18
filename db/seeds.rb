# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

puts "Cleaning database..."
Life.destroy_all

puts "Creating a user"
user = User.create!(
  email: "rina@gmail.com",
  password: "test123"
)

puts "Creating some lives..."
10.times do
  life = Life.create!(
    title: Faker::Superhero.name,
    description: Faker::Quote.most_interesting_man_in_the_world,
    user: user
    )
  puts "Life with id #{life.id} was created"

end

puts "Created #{Life.count} lives"