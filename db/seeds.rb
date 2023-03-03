# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

Booking.destroy_all
Beast.destroy_all
User.destroy_all

# TAGS = %w[aquatic flying scaler wings tetrapod anphibic shell feathures carnivorus giant violent humanoïd bug plant polymorph elemental immaterial]

addresses = []
addresses << "16 Villa Gaudelet, Paris"
addresses << "12 rue de la croix de bois, Boran sur Oise"
addresses << "20 Rue Louis Perissol, Cannes, Alpes-Maritimes 06400, France"
addresses << "Rue D' Eupen 20, 4950 Waimes, Liege, Belgium"


# 5.times do
#   user = User.create!(first_name: Faker::Movies::HarryPotter.character,
#                last_name: Faker::Movies::HarryPotter.house,
#                email: Faker::Internet.email,
#                password: Faker::Internet.password(min_length: 8))
#   2.times do
#     beast = Beast.new(name: "XX-Nazrog-xX", race: Faker::Fantasy::Tolkien.race, danger_gauge: rand(1..10), address: addresses.sample, price_per_day: 35, description: "djfbvmpefvypsemf")
#     beast.user = user
#     beast.tags = TAGS.sample(2)
#     beast.save!
#   end
# end



harry = User.new(first_name: "Harry", last_name: "Potter", email: "jtm_voldemort@baguetteforever.com", password: "xpourquoi")
harry.photo.attach(io: URI.open("https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FFAC.2Fvar.2Ffemmeactuelle.2Fstorage.2Fimages.2Fculture.2Fnews-culture.2Fharry-potter-enfin-papa.21-18074.2F12621795-1-fre-FR.2Fharry-potter-enfin-papa.2Ejpg/1200x1200/quality/80/crop-from/center/harry-potter-enfin-papa.jpeg"), filename: "hedwige.png", content_type: "image/png")
harry.save!

hagrid = User.new(first_name: "Hagrid", last_name: "Rubeus", email: "dumbledorwinkwink@love-animals.com", password: "foodisgood")
hagrid.photo.attach(io: URI.open("https://cdn-uploads.gameblog.fr/img/news/408108_634addf2af49a.jpg"), filename: "heedwige.png", content_type: "image/png")
hagrid.save!

malefoy = User.new(first_name: "Drago", last_name: "Malefoy", email: "malefoy@thisisme.com", password: "secretlyinlovewithharry")
malefoy.photo.attach(io: URI.open("https://wingardium-leviosa.com/wp-content/uploads/2018/03/draco-malfoy-produit-baguette-magique.jpg"), filename: "heeedwige.png", content_type: "image/png")
malefoy.save!


#

file = URI.open("https://www.allaboutbirds.org/guide/assets/photo/297366501-480px.jpg")
beast = Beast.new(race: "Owl", name: "hedwige", description: "flying beast", danger_gauge: 3, price_per_day: 15, tags: ["flying"], address: addresses.sample)
beast.photos.attach(io: file, filename: "hedwige.jpg", content_type: "image/jpg")
beast.user = harry
beast.save

file = URI.open("https://images.ctfassets.net/usf1vwtuqyxm/5MpipXwqg8Y8MEiWS8sSeg/0a6aabc8f58a01b81def05cb4c34c876/FB-TRL3-89386.jpg?w=388&h=248&fit=fill&f=top&fm=webp&q=50")
beast = Beast.new(race: "Niffler", name: "Nifnif", description: "shiny theif", danger_gauge: 2, price_per_day: 255, tags: ["tetrapod"], address: addresses.sample)
beast.photos.attach(io: file, filename: "nifnif-stealing.png", content_type: "image/png")
beast.user = harry
beast.save

file = URI.open("http://pm1.narvii.com/7082/5c689b6cf242d8fe3eaa12e472f87d0272a7507br1-736-520v2_uhq.jpg")
beast = Beast.new(race: "Basilisk", name: "Kroc", description: "A dangerous beast Salasar left behind", danger_gauge: 9, price_per_day: 100000, tags: ["violent"], address: addresses.sample)
beast.photos.attach(io: file, filename: "venomous_spider.png", content_type: "image/png")
beast.user = harry
beast.save

file = URI.open("https://static.wikia.nocookie.net/harrypotter/images/1/1c/Buckbeak.JPG/revision/latest?cb=20090814105639")
beast = Beast.new(race: "Hippogriff", name: "Buck", description: "A bird horse, kinda cute", danger_gauge: 6, price_per_day: 1500, tags: ["flying"], address: addresses.sample)
beast.photos.attach(io: file, filename: "cuty-buck.png", content_type: "image/png")
beast.user = harry
beast.save

file = URI.open("https://i.ytimg.com/vi/HNy7hAOtsEE/maxresdefault.jpg")
beast = Beast.new(race: "Demiguise", name: "Old branch", description: "lazy demiguise who loves to play hide and seek", danger_gauge: 4, price_per_day: 850, tags: ["humanoid"], address: addresses.sample)
beast.photos.attach(io: file, filename: "shy-demiguise.png", content_type: "image/png")
beast.user = harry
beast.save

file = URI.open("https://monsterlegacy.files.wordpress.com/2017/02/aragogthreequart.jpg")
beast = Beast.new(race: "Acromentula", name: "Aragog", description: "spooky spider that spiraled out of control", danger_gauge: 7, price_per_day: 15, tags: ["bug", "violent", "carnivorous"], address: addresses.sample)
beast.photos.attach(io: file, filename: "spooky-spider.png", content_type: "image/png")
beast.user = hagrid
beast.save

file = URI.open("https://static.wikia.nocookie.net/harrypotter/images/2/22/Fang.jpg/revision/latest/scale-to-width-down/301?cb=20100220154955")
beast = Beast.new(race: "Dog", name: "Fang", description: "Lazy, scared dog", danger_gauge: 1, price_per_day: 4, tags: ["tetrapod"], address: addresses.sample)
beast.photos.attach(io: file, filename: "hagrids-dog.png", content_type: "image/png")
beast.user = hagrid
beast.save

file = URI.open("http://pm1.narvii.com/7098/cc2bc4422329b7dc1b7a77b19dbb8db54c8b94f7r1-469-339v2_00.jpg")
beast = Beast.new(race: "Swooping", name: "Chaser", description: "A revenge ? I may have somthing for you !", danger_gauge: 8, price_per_day: 750, tags: ["flyings", "carnivorous", "violent"], address: addresses.sample)
beast.photos.attach(io: file, filename: "swooping.png", content_type: "image/png")
beast.user = malefoy
beast.save

file = URI.open("https://lecridelagargouillefr.files.wordpress.com/2020/06/img_0750.jpg")
beast = Beast.new(race: "Thunderbird", name: "Flash", description: "Super cool to impress your girlfriend !", danger_gauge: 3, price_per_day: 2500, tags: ["flying", "feathures"], address: addresses.sample)
beast.photos.attach(io: file, filename: "thunder.png", content_type: "image/png")
beast.user = malefoy
beast.save

file = URI.open("https://www.thebettertoystore.com/pub/media/catalog/product/cache/image/500x500/e9c3970ab036de70892d86c6d221abfe/3/5/355134.jpg")
beast = Beast.new(race: "Bowtruckle", name: "Stick", description: "To chill and watch Netflix, he's a good partner.", danger_gauge: 1, price_per_day: 124, tags: ["plant", "bug"], address: addresses.sample)
beast.photos.attach(io: file, filename: "Bowtruckle.png", content_type: "image/png")
beast.user = malefoy
beast.save

# TAGS = %w[aquatic flying scaler wings tetrapod anphibic shell feathures carnivorus giant violent humanoïd bug plant polymorph elemental immaterial]

# hedwige = Beast.new(race: "hibou", danger_gauge: 3, price_per_day: 15, tags: ["flying"], photos: [""])
# nifnif = Beast.new(race: "niffler", danger_gauge: 2, price_per_day: 66, tags: ["tetrapod"], photos: ["https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2016%2F08%2Ffantastic-beasts-002.jpg&q=60"])

# hedwige.user = harry
# hedwige.save!

# nifnif.user = harry
# nifnif.save!
