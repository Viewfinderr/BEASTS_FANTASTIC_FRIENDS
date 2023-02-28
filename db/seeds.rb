# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

5.times do
  user = User.create!(first_name: Faker::Movies::HarryPotter.character, last_name: Faker::Movies::HarryPotter.house, email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8))
end

10.times do
  beast = Beast.new(race: Faker::Fantasy::Tolkien.race, danger_gauge: 6, tags: Faker::Verb.past_participle, price_per_day: 35)
  beast.user = User.all.sample
  beast.save!
end
