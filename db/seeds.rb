# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning Database"
News.destroy_all
Comment.destroy_all
Channel.destroy_all
History.destroy_all
Player.destroy_all
Asset.destroy_all
Holding.destroy_all
User.destroy_all

marc = User.new(email: "marchage1@gmail.com", first_name: "Marc", last_name: "Hage", password: "123456789", balance: 10000)
marc.save
leo = User.new(email: "leokreutz@gmail.com", first_name: "Leonard", last_name: "Kreutzberg", password: "123456789", balance: 15000)
leo.save
puts "Users created"

james_asset = Asset.new(name: "Reece James", abbreviation: "REJS", rating: rand(0..10), category: "player", description: "The best RB in the premier league")
james_asset.save

trent_asset = Asset.new(name: "Trent Alexander-Arnold", abbreviation: "TRAA", rating: rand(0..10), category: "player", description: "The 2nd best RB in the premier league")
trent_asset.save

palmer_asset = Asset.new(name: "Cole Palmer", abbreviation: "CPLM", rating: rand(0..10), category: "player", description: "Breakthrough Chelsea player")
palmer_asset.save

messi_asset = Asset.new(name: "Lionel Messi", abbreviation: "LOME", rating: rand(0..10), category: "player", description: "The goat")
messi_asset.save

gordon_asset = Asset.new(name: "Anthony Gordon", abbreviation: "ANGR", rating: rand(0..10), category: "player", description: "The everton boy who went to Newcastle")
gordon_asset.save

bowen_asset = Asset.new(name: "Jarrod Bowen", abbreviation: "JRBW", rating: rand(0..10), category: "player", description: "England forward with rapid pace")
bowen_asset.save

cunha_asset = Asset.new(name: "Matheus Cunha", abbreviation: "MTCH", rating: rand(0..10), category: "player", description: "Brazialin who plays at wolves")
cunha_asset.save

olise_asset = Asset.new(name: "Michael Olise", abbreviation: "MHOL", rating: rand(0..10), category: "player", description: "French talent")
olise_asset.save

willian_asset = Asset.new(name: "Willian", abbreviation: "WILL", rating: rand(0..10), category: "player", description: "Ex chelsea giant")
willian_asset.save

elanga_asset = Asset.new(name: "Anthony Elanga", abbreviation: "ANEL", rating: rand(0..10), category: "player", description: "Manchest united talent on loan")
elanga_asset.save

nunez_asset = Asset.new(name: "Darwin Nunez", abbreviation: "DRNZ", rating: rand(0..10), category: "player", description: "Uruguay stricker for liverpool")
nunez_asset.save

haaland_asset = Asset.new(name: "Erling Haaland", abbreviation: "ERHL", rating: rand(0..10), category: "player", description: "The norweigian beast")
haaland_asset.save

james_history1 = History.create(date: Date.parse("2023-11-27"), price: 45.6, asset: james_asset)
james_history2 = History.create(date: Date.parse("2023-11-28"), price: 55.6, asset: james_asset)
james_history3 = History.create(date: Date.parse("2023-11-29"), price: 59.6, asset: james_asset)

trent_history1 = History.create(date: Date.parse("2023-11-27"), price: 23.6, asset: trent_asset)
trent_history2 = History.create(date: Date.parse("2023-11-28"), price: 25.6, asset: trent_asset)
trent_history3 = History.create(date: Date.parse("2023-11-28"), price: 22.6, asset: trent_asset)

palmer_history1 = History.create(date: Date.parse("2023-11-27"), price: 9.6, asset: palmer_asset)
palmer_history2 = History.create(date: Date.parse("2023-11-28"), price: 10.6, asset: palmer_asset)
palmer_history3 = History.create(date: Date.parse("2023-11-28"), price: 13.2, asset: palmer_asset)

messi_history1 = History.create(date: Date.parse("2023-11-27"), price: 230.4, asset: messi_asset)
messi_history2 = History.create(date: Date.parse("2023-11-28"), price: 235.3, asset: messi_asset)
messi_history3 = History.create(date: Date.parse("2023-11-28"), price: 232.4, asset: messi_asset)

gordon_history1 = History.create(date: Date.parse("2023-11-27"), price: 11.4, asset: gordon_asset)
gordon_history2 = History.create(date: Date.parse("2023-11-28"), price: 12.3, asset: gordon_asset)
gordon_history3 = History.create(date: Date.parse("2023-11-28"), price: 9.4, asset: gordon_asset)

bowen_history1 = History.create(date: Date.parse("2023-11-27"), price: 15.4, asset: bowen_asset)
bowen_history2 = History.create(date: Date.parse("2023-11-28"), price: 16.3, asset: bowen_asset)
bowen_history3 = History.create(date: Date.parse("2023-11-28"), price: 14.4, asset: bowen_asset)

cunha_history1 = History.create(date: Date.parse("2023-11-27"), price: 9.2, asset: cunha_asset)
cunha_history2 = History.create(date: Date.parse("2023-11-28"), price: 9.8, asset: cunha_asset)
cunha_history3 = History.create(date: Date.parse("2023-11-28"), price: 9.9, asset: cunha_asset)

olise_history1 = History.create(date: Date.parse("2023-11-27"), price: 19.2, asset: olise_asset)
olise_history2 = History.create(date: Date.parse("2023-11-28"), price: 19.8, asset: olise_asset)
olise_history3 = History.create(date: Date.parse("2023-11-28"), price: 19.9, asset: olise_asset)

willian_history1 = History.create(date: Date.parse("2023-11-27"), price: 12.2, asset: willian_asset)
willian_history2 = History.create(date: Date.parse("2023-11-28"), price: 12.8, asset: willian_asset)
willian_history3 = History.create(date: Date.parse("2023-11-28"), price: 13.9, asset: willian_asset)

elanga_history1 = History.create(date: Date.parse("2023-11-27"), price: 5.2, asset: elanga_asset)
elanga_history2 = History.create(date: Date.parse("2023-11-28"), price: 5.8, asset: elanga_asset)
elanga_history3 = History.create(date: Date.parse("2023-11-28"), price: 5.9, asset: elanga_asset)

nunez_history1 = History.create(date: Date.parse("2023-11-27"), price: 15.2, asset: nunez_asset)
nunez_history2 = History.create(date: Date.parse("2023-11-28"), price: 15.8, asset: nunez_asset)
nunez_history3 = History.create(date: Date.parse("2023-11-28"), price: 17.9, asset: nunez_asset)

haaland_history1 = History.create(date: Date.parse("2023-11-27"), price: 85.2, asset: haaland_asset)
haaland_history2 = History.create(date: Date.parse("2023-11-28"), price: 85.8, asset: haaland_asset)
haaland_history3 = History.create(date: Date.parse("2023-11-28"), price: 87.9, asset: haaland_asset)

puts "Assets created"

james = Player.new(asset: james_asset, position: "right back", club: "Chelsea", height: 180, weight: 80, dob: Date.parse("2000-02-20"), nationality: "English", games_played: 322, goals: 13, assists: 500)
james.save
trent = Player.new(asset: trent_asset, position: "right back", club: "Liverpool", height: 190, weight: 70, dob: Date.parse("1998-06-19"), nationality: "English", games_played: 642, goals: 3, assists: 5)
trent.save
puts "Players created"
