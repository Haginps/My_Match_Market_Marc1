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
Investment.destroy_all
Holding.destroy_all
User.destroy_all

marc = User.new(email: "marchage1@gmail.com", first_name: "Marc", last_name: "Hage", password: "123456789", balance: 10000)
marc.save
leo = User.new(email: "leokreutz@gmail.com", first_name: "Leonard", last_name: "Kreutzberg", password: "123456789", balance: 15000)
leo.save
puts "Users created"

james_investment = Investment.new(name: "Reece James", abbreviation: "REJS", rating: rand(0..10), category: "player", description: "The best RB in the premier league", image: "assets/reece_james_icon.png")
james_investment.save

trent_investment = Investment.new(name: "Trent Alexander-Arnold", abbreviation: "TRAA", rating: rand(0..10), category: "player", description: "The 2nd best RB in the premier league")
trent_investment.save

palmer_investment = Investment.new(name: "Cole Palmer", abbreviation: "CPLM", rating: rand(0..10), category: "player", description: "Breakthrough Chelsea player")
palmer_investment.save

messi_investment = Investment.new(name: "Lionel Messi", abbreviation: "LOME", rating: rand(0..10), category: "player", description: "The goat")
messi_investment.save

gordon_investment = Investment.new(name: "Anthony Gordon", abbreviation: "ANGR", rating: rand(0..10), category: "player", description: "The everton boy who went to Newcastle")
gordon_investment.save

bowen_investment = Investment.new(name: "Jarrod Bowen", abbreviation: "JRBW", rating: rand(0..10), category: "player", description: "England forward with rapid pace")
bowen_investment.save

cunha_investment = Investment.new(name: "Matheus Cunha", abbreviation: "MTCH", rating: rand(0..10), category: "player", description: "Brazialin who plays at wolves")
cunha_investment.save

olise_investment = Investment.new(name: "Michael Olise", abbreviation: "MHOL", rating: rand(0..10), category: "player", description: "French talent")
olise_investment.save

willian_investment = Investment.new(name: "Willian", abbreviation: "WILL", rating: rand(0..10), category: "player", description: "Ex chelsea giant")
willian_investment.save

elanga_investment = Investment.new(name: "Anthony Elanga", abbreviation: "ANEL", rating: rand(0..10), category: "player", description: "Manchest united talent on loan")
elanga_investment.save

nunez_investment = Investment.new(name: "Darwin Nunez", abbreviation: "DRNZ", rating: rand(0..10), category: "player", description: "Uruguay stricker for liverpool")
nunez_investment.save

haaland_investment = Investment.new(name: "Erling Haaland", abbreviation: "ERHL", rating: rand(0..10), category: "player", description: "The norweigian beast")
haaland_investment.save

james_history1 = History.create(date: Date.parse("2023-11-27"), price: 45.6, investment: james_investment)
james_history2 = History.create(date: Date.parse("2023-11-28"), price: 55.6, investment: james_investment)
james_history3 = History.create(date: Date.parse("2023-11-29"), price: 59.6, investment: james_investment)

trent_history1 = History.create(date: Date.parse("2023-11-27"), price: 23.6, investment: trent_investment)
trent_history2 = History.create(date: Date.parse("2023-11-28"), price: 25.6, investment: trent_investment)
trent_history3 = History.create(date: Date.parse("2023-11-28"), price: 22.6, investment: trent_investment)

palmer_history1 = History.create(date: Date.parse("2023-11-27"), price: 9.6, investment: palmer_investment)
palmer_history2 = History.create(date: Date.parse("2023-11-28"), price: 10.6, investment: palmer_investment)
palmer_history3 = History.create(date: Date.parse("2023-11-28"), price: 13.2, investment: palmer_investment)

messi_history1 = History.create(date: Date.parse("2023-11-27"), price: 230.4, investment: messi_investment)
messi_history2 = History.create(date: Date.parse("2023-11-28"), price: 235.3, investment: messi_investment)
messi_history3 = History.create(date: Date.parse("2023-11-28"), price: 232.4, investment: messi_investment)

gordon_history1 = History.create(date: Date.parse("2023-11-27"), price: 11.4, investment: gordon_investment)
gordon_history2 = History.create(date: Date.parse("2023-11-28"), price: 12.3, investment: gordon_investment)
gordon_history3 = History.create(date: Date.parse("2023-11-28"), price: 9.4, investment: gordon_investment)

bowen_history1 = History.create(date: Date.parse("2023-11-27"), price: 15.4, investment: bowen_investment)
bowen_history2 = History.create(date: Date.parse("2023-11-28"), price: 16.3, investment: bowen_investment)
bowen_history3 = History.create(date: Date.parse("2023-11-28"), price: 14.4, investment: bowen_investment)

cunha_history1 = History.create(date: Date.parse("2023-11-27"), price: 9.2, investment: cunha_investment)
cunha_history2 = History.create(date: Date.parse("2023-11-28"), price: 9.8, investment: cunha_investment)
cunha_history3 = History.create(date: Date.parse("2023-11-28"), price: 9.9, investment: cunha_investment)

olise_history1 = History.create(date: Date.parse("2023-11-27"), price: 19.2, investment: olise_investment)
olise_history2 = History.create(date: Date.parse("2023-11-28"), price: 19.8, investment: olise_investment)
olise_history3 = History.create(date: Date.parse("2023-11-28"), price: 19.9, investment: olise_investment)

willian_history1 = History.create(date: Date.parse("2023-11-27"), price: 12.2, investment: willian_investment)
willian_history2 = History.create(date: Date.parse("2023-11-28"), price: 12.8, investment: willian_investment)
willian_history3 = History.create(date: Date.parse("2023-11-28"), price: 13.9, investment: willian_investment)

elanga_history1 = History.create(date: Date.parse("2023-11-27"), price: 5.2, investment: elanga_investment)
elanga_history2 = History.create(date: Date.parse("2023-11-28"), price: 5.8, investment: elanga_investment)
elanga_history3 = History.create(date: Date.parse("2023-11-28"), price: 5.9, investment: elanga_investment)

nunez_history1 = History.create(date: Date.parse("2023-11-27"), price: 15.2, investment: nunez_investment)
nunez_history2 = History.create(date: Date.parse("2023-11-28"), price: 15.8, investment: nunez_investment)
nunez_history3 = History.create(date: Date.parse("2023-11-28"), price: 17.9, investment: nunez_investment)

haaland_history1 = History.create(date: Date.parse("2023-11-27"), price: 85.2, investment: haaland_investment)
haaland_history2 = History.create(date: Date.parse("2023-11-28"), price: 85.8, investment: haaland_investment)
haaland_history3 = History.create(date: Date.parse("2023-11-28"), price: 87.9, investment: haaland_investment)

puts "Investments created"

james = Player.new(investment: james_investment, position: "right back", club: "Chelsea", height: 180, weight: 80, dob: Date.parse("2000-02-20"), nationality: "English", games_played: 322, goals: 13, assists: 500)
james.save
trent = Player.new(investment: trent_investment, position: "right back", club: "Liverpool", height: 190, weight: 70, dob: Date.parse("1998-06-19"), nationality: "English", games_played: 642, goals: 3, assists: 5)
trent.save
puts "Players created"
