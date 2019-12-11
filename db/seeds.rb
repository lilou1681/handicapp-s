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
Organization.destroy_all
Information.destroy_all

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
    gender: "Femme",
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

    organization = Organization.create!(
      name: "MDPH du Var",
      adress: "293 Route de la Seyne , 83190 Ollioules",
      phone_number: "04 94 05 10 40",
      email: "mdph83@mdph.fr",
      website: "https://mdph.var.fr/",
      remote_photo_url: "https://mdph.var.fr/image/layout_set_logo?img_id=37636&t=1575173111468"
      )
    organization = Organization.create!(
      name: "MDPH des bouches du rhone",
      adress: "4 Boulevard Euromediterranée Quai d'Arenc, 13002 Marseille",
      phone_number: "0 800 81 48 44",
      email: "mdph13@mdph.fr",
      website: "http://www.mdph13.fr/",
      remote_photo_url:"http://www.ash13.ien.13.ac-aix-marseille.fr/spip/sites/www.ash13.ien.13/spip/local/cache-vignettes/L212xH125/Capture_d_e_cran_2014-01-17_a_07-59-15-1cd44.png"
      )
    organization = Organization.create!(
      name: "MDPH du Vaucluse",
      adress: "22 Boulevard Saint-Michel, 84000 Avignon",
      phone_number: "0 800 80 05 79",
      email: "mdph84@mdph.fr",
      website: "http://www.mdph.fr/",
      remote_photo_url:"http://img.over-blog-kiwi.com/300x300/1/54/21/63/20150708/ob_be8fae_logo-mdph.jpg"
      )
    user = User.create!(
      first_name: "hello",
      last_name: "test",
      email: "hello@test.com",
      password: "123456",
      password_confirmation: "123456",
      address: "167 rue paradis 13006 marseille",
      remote_photo_url: "https://picsum.photos/id/80/200/300"
      )

    information = Information.create!(
      title: "Qu'est ce que la MDPH ?",
      content: "Créée par la loi de 2005,
                la Maison départementale des personnes handicapées (MDPH)
                exerce une mission d’accueil, d’information, d’accompagnement
                et de conseil des personnes en situation de handicap et de leurs familles
                ainsi que de sen-sibilisation de tous les citoyens aux handicaps."
      )
    information = Information.create!(
      title: "Carte mobilité inclusion",
      content: "La carte mobilité inclusion (CMI) a pour but de faciliter la vie quotidienne
                des personnes en situation de handicap et de perte d'autonomie.
                Elle est accordée sous conditions et permet de bénéficier de certains droits
                notamment dans les transports."
      )
    information = Information.create!(
      title: "EMPLOI ET FORMATION",
      content: "La loi du 11 février 2005 pour l’égalitédes droits et des chances,
                la participation et lacitoyennetédes personnes handicapées,
                pose le principe de non-discrimination des personnes en situation
                de handicap en particulier dans le domaine de l’emploi,
                en promouvant l’accès aux dispositifs de droit commun et en faisant du travail ordinaire une priorite"
      )

puts "#{User.count} users created"
puts "#{Children.count} childrens created"
puts "#{Reminder.count} reminders created"
puts "#{Organization.count} organization created"
puts "#{Information.count} informations created"
