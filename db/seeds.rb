# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

john = User.create!(email: 'example1@test.com', password: 'password', first_name: 'John', last_name: 'Smith')
nathaniel = User.create!(email: 'example2@test.com', password: 'password', first_name: 'Nathaniel', last_name: 'Mether')
ruegen = User.create!(email: 'example3@test.com', password: 'password', first_name: 'Ruegen', last_name: 'Aschenbrener')
sarah = User.create!(email: 'example4@test.com', password: 'password', first_name: 'Sarah', last_name: 'Smith')
User.create!(email: 'example5@test.com', password: 'password', first_name: 'Amy', last_name: 'Smith')

[john, nathaniel, ruegen, sarah].each do |name|
  Profile.create!(user_id: name.id, board_sport: 'surfing', price: rand(20..80), locations: 'Point Leo, Gunnamatta', bio: 'Suring is my passion, surfing is my life', description: 'Skilled surfer with 10 years of surfing experience. Happy to teach beginners and intermediate surfers. I have a spare surfboard that you can use as well.')
end
