# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Garden.destroy_all
Plant.destroy_all
Task.destroy_all

User.create(
    {
        username: "fran",
        password: "asdf",
        password_confirmation: "asdf"
        
    }
)

Garden.create(
    {
        garden_name: Faker::FunnyName.name,
        user_id: User.first.id
    }
)

10.times do 
    Plant.create(
        plant_type: Faker::Cannabis.strain,
        nickname: Faker::FunnyName.two_word_name,
        size: 4,
        water_ammount: 2,
        garden_id: Garden.first.id
    )
end

puts "done seeding :D"