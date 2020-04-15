# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: 'admin')

user = []

9.times do |n|
  user[n] = User.create!(name: "#{Faker::Name.first_name}_s#{n+1}")
end

user.each do |val|
  3.times do
    val.nutriments.create!(name: Faker::Food.fruits,
                           amount: Faker::Number.number(digits: 4))
  end
end