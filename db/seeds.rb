# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.create!(title:  "abc",
             description: "abcdaadfadg",
             user_id: '1',
             image: File.open(Rails.root + "app/assets/images/anonuser.jpg") )

99.times do |n|
  title  = Faker::Name.name
  description = "abcdasdgfdznsfgnsf"
  user_id = 1
  Article.create!(title: title,
               description: description,
               user_id: user_id
               image: File.open(Rails.root + "app/assets/images/anonuser.jpg"))


end
