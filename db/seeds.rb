# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

john = User.create!(email: 'example1@test.com', password: 'password', first_name: 'John', last_name: 'Smith')
nathaniel = User.create!(email: 'example2@test.com', password: 'password', first_name: 'Nathaniel', last_name: 'Mether')
ruegen = User.create!(email: 'example3@test.com', password: 'password', first_name: 'Ruegen', last_name: 'Aschenbrenner')
sarah = User.create!(email: 'example4@test.com', password: 'password', first_name: 'Sarah', last_name: 'Smith')
amy = User.create!(email: 'example5@test.com', password: 'password', first_name: 'Amy', last_name: 'Smith')

[john, nathaniel, ruegen, sarah].each do |name|
  Profile.create!(user_id: name.id, board_sport: 'surfing', price: rand(20..80), locations: 'Point Leo, Gunnamatta', bio: 'Surfing is my passion, surfing is my life', description: 'Skilled surfer with 10 years of surfing experience. Happy to teach beginners and intermediate surfers. I have a spare surfboard that you can use as well.')
end

[john, nathaniel, amy].each do |name|
  Profile.create!(user_id: name.id, board_sport: 'snow boarding', price: rand(20..80), locations: 'Mt. Hotham', bio: 'Lets shred up some powder!', description: "Oh, the weather outside is frightful. But the fire is so delightful and since we've no place to go. Let it snow, let it snow, let it snow! Man it doesn't show signs of stoppin' and I brought some corn for poppin'. The lights are turned way down low. Let it snow, let it snow, let it snow!")
end

profile = 1
while profile < 8 do 
    number_of_reviews = rand(10)
    index = 0
    while index < number_of_reviews do
        Review.create!(user_id: rand(2..5), profile_id: profile, content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam, ut paulo ante docui, augendae voluptatis finis est doloris omnis amotio. Tum Quintus: Est plane, Piso, ut dicis, inquit. Scio enim esse quosdam, qui quavis lingua philosophari possint; Duo Reges: constructio interrete. Aliter enim nosmet ipsos nosse non possumus. Diodorus, eius auditor, adiungit ad honestatem vacuitatem doloris. Illud dico, ea, quae dicat, praeclare inter se cohaerere.', rating: rand(5))
        index += 1
    end
    profile += 1
end
