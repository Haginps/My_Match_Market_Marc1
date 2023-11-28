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

james_asset = Asset.new(name: "Reece James", abbreviation: "RJ", rating: rand(0..10), category: "player", description: "The best RB in the premier league")
james_asset.save
trent_asset = Asset.new(name: "Trent Alexander-Arnold", abbreviation: "TAA", rating: rand(0..10), category: "player", description: "The 2nd best RB in the premier league")
trent_asset.save
puts "Assets created"

james = Player.new(asset: james_asset, position: "right back", club: "Chelsea", height: 180, weight: 80, dob: Date.parse("2000-02-20"), nationality: "English", games_played: 322, goals: 13, assists: 500)
james.save
trent = Player.new(asset: trent_asset, position: "right back", club: "Liverpool", height: 190, weight: 70, dob: Date.parse("1998-06-19"), nationality: "English", games_played: 642, goals: 3, assists: 5)
trent.save
puts "Players created"
