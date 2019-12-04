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
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    address: Faker::Address.street_address,
    remote_photo_url: "https://picsum.photos/id/80/200/300"
  )
  children = Children.create!(
    user_id: user.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_day: Faker::Date.between(from: 2.days.ago, to: Date.today),
    gender: Faker::Gender.binary_type,
    nationality: Faker::Nation.nationality,
    country: Faker::Address.city,
    address: Faker::Address.street_address,
    security_number: Faker::Number.number(digits: 15),
    life_project: Faker::Lorem.paragraph,
    remote_photo_url: "https://picsum.photos/200/300"
  )
    reminder = Reminder.create!(
      children_id: children.id,
      name: Faker::Name,
      date: Faker::Date.between(from: 2.days.ago, to: Date.today)
      )
end
puts "#{User.count} users created"
puts "#{Children.count} childrens created"
puts "#{Reminder.count} reminders created"
