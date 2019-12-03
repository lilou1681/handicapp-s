# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


puts "Cleaning Database ..."

User.destroy_all
Children.destroy_all
Reminder.destroy_all

puts "Start Seeding ..."

5.times do
  user = User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "password",
    password_confirmation: "password",
    address: Faker::Address.street_address
  )
  children = Children.create!(
    user_id: user.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_day:Faker::Date.birthday(min_age: 0, max_age: 65) ,
    gender: Faker::Gender.binary_type,
    nationality:Faker::Nation.nationality,
    country: Faker::Address.city,
    address: Faker::Address.street_address,
    security_number:Faker::Number.number(digits: 13),
    life_project: Faker::Lorem.paragraph  ,
  )
    reminder = Reminder.create!(
      children_id: children.id,
      name: Faker::Name,
      date: Faker::date,
      )
end
puts "#{User.count} users created"
puts "#{Children.count} childrens created"
puts "#{Reminder.count} reminders created"
