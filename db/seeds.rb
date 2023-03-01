# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Booking.destroy_all
Beast.destroy_all
User.destroy_all

TAGS = %w[aquatic flying scaler wings tetrapod anphibic shell feathures carnivorus giant violent humanoïd bug plant polymorph elemental immaterial]

addresses = []
addresses << "16 Villa Gaudelet, Paris"
addresses << "12 rue de la croix de bois, Boran sur Oise"

5.times do
  user = User.create!(first_name: Faker::Movies::HarryPotter.character,
               last_name: Faker::Movies::HarryPotter.house,
               email: Faker::Internet.email,
               password: Faker::Internet.password(min_length: 8))
  2.times do
    beast = Beast.new(name: "XX-Nazrog-xX", race: Faker::Fantasy::Tolkien.race, danger_gauge: rand(1..10), address: addresses.sample, price_per_day: 35, description: "djfbvmpefvypsemf")
    beast.user = user
    beast.tags = TAGS.sample(2)
    beast.save!
  end
end
