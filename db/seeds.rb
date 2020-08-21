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
# User.destroy_all

# puts "Creating a user"
# user = User.create!(
#   email: "nina@gmail.com",
#   first_name:"Nina",
#   password: "test123",
#   last_name: "Snow",
#   username: "titi"
# )

# user_two = User.create!(
#   email: "ginast@gmail.com",
#   first_name: "Nina",
#   password: "test123",
#   last_name: "Snow",
#   username: "toto"
# )

# user_three = User.create!(
#   email: "binast@gmail.com",
#   first_name: "Tina",
#   password: "test123",
#   last_name: "Snow",
#   username: "tutu"
# )

# life_one = Life.create!(
#   title: "Superwoman",
#   description: "She is fierce, rich and saves the world. Try it yourself!",
#   user: user_two
# )

# life_two = Life.create!(
#   title: "Taylor Swift",
#   description: "Beautiful countrysongs, lives the lifestyle of the rich and famous. Can this be you?",
#   user: user_three
# )

# puts "Creating some lives..."
# 10.times do
#   life = Life.create!(
#     title: Faker::Superhero.name,
#     description: Faker::Quote.most_interesting_man_in_the_world,
#     user: user
#     )
#   puts "Life with id #{life.id} was created"

# end

# puts "Created #{Life.count} lives"