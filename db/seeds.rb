# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

puts "Cleaning Database"
# News.destroy_all
Comment.destroy_all
Post.destroy_all
Channel.destroy_all
History.destroy_all
Player.destroy_all
TradeHistory.destroy_all
Holding.destroy_all
Investment.destroy_all
TokenHistory.destroy_all
UserHistory.destroy_all
User.destroy_all

marc = User.new(email: "marchage1@gmail.com", first_name: "Marc", last_name: "Hage", password: "123456789", tokens: 5000)
marc.save

marc.set_default_tokens
leo = User.new(email: "leokreutz@gmail.com", first_name: "Leonard", last_name: "Kreutzberg", password: "123456789", tokens: 15000)
leo.save
leo.set_default_tokens

# marc.set_default_tokens
# leo = User.new(email: "leokreutz@gmail.com", first_name: "Leonard", last_name: "Kreutzberg", password: "123456789", tokens: 15000)
# leo.save
# leo.set_default_tokens

puts "Users created"

file = URI.open("https://e0.365dm.com/21/05/2048x1152/skysports-chelsea-champions-league-final_5399567.jpg?20210529221935")
channel_1 = Channel.new(title: "The Blue Flag", description: "Welcome to the Chelsea FC Fan Channel – your ultimate destination for everything Blues! ⚽️ Get ready for exclusive content, match analyses, fan reactions, and behind-the-scenes glimpses into the world of Chelsea FC. Whether you bleed blue or just love the beautiful game, join us in celebrating the pride of London! :large_blue_circle: #CFC #KTBFFH", user: User.last)
channel_1.photo.attach(io: file, filename: "chelseafc", content_type: "image/jpg")
channel_1.save

file = URI.open("https://media.newyorker.com/photos/5cf3e1df91fa13ce6cb2af72/master/w_2240,c_limit/Caesar-LiverpoolVictory-1.jpg")
channel_2 = Channel.new(title: "The Reds", description: "Immerse yourself in the world of Liverpool FC with matchday euphoria, expert analyses, and a vibrant community of fellow Kopites. From iconic victories to the latest news, this channel is your front-row seat to the Anfield experience. Join us in celebrating the rich history and thrilling moments of Liverpool FC. Walk with us through the journey of YNWA - You'll Never Walk Alone. #LFC #YNWA", user: User.last)
channel_2.photo.attach(io: file, filename: "liverpoolfc", content_type: "image/jpg")
channel_2.save

file = URI.open("https://pbs.twimg.com/media/ESAzI4RWkAELB-_?format=jpg&name=large")
channel_3 = Channel.new(title: "The Gooners", description: "Dive into the heart of North London with matchday reactions, in-depth analyses, and passionate discussions about the Gunners. Join our community of devoted fans as we live and breathe Arsenal FC. From historic moments to the latest updates, this is your go-to destination for all things Arsenal. Get ready to chant loud and proud! #COYG #ArsenalFC", user: User.last)
channel_3.photo.attach(io: file, filename: "arsenalfc", content_type: "image/jpg")
channel_3.save

file = URI.open("https://www.talkchelsea.net/wp-content/uploads/2023/10/noni-madueke-chelsea.jpg")
post_1 = Post.new(title: "Madueke Stock Report: Bearish Trends", description: "In the football market, Madueke’s stock is currently facing a bearish downturn. Despite initial promise, recent performances have seen a dip in form, raising concerns among investors. The lack of impactful contributions, missed opportunities, and subpar displays on the pitch have led to a decline in Madueke’s stock value. Market analysts suggest cautious monitoring as the player navigates this challenging period. #Madueke #StockDown", user: User.last)
post_1.channel = channel_1
post_1.photo.attach(io: file, filename: "noni", content_type: "image/jpg")
post_1.save


file = URI.open("https://cdn.vox-cdn.com/thumbor/YmJcbsDWhqLirKMvIGz-D8vkgNc=/0x0:2837x3716/1820x1213/filters:focal(1078x655:1530x1107):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/72824081/1769303492.0.jpg")
post_2 = Post.new(title: "Badiashile Stock Update: Resilient Recovery", description: "Badiashile, the defensive powerhouse, has rebounded from injury with remarkable resilience, signaling a potential bullish turnaround. :ambulance::back: After a period of absence, this player is back on the field, showcasing strength, determination, and an unwavering commitment to the game. Analysts are closely monitoring this stock, anticipating a positive trajectory as Badiashile regains full form and contributes to the team’s defensive solidity. Investors, take note — this is a recovery story with the potential for substantial gains!", user: User.last)
post_2.channel = channel_1
post_2.photo.attach(io: file, filename: "benoit", content_type: "image/jpg")
post_2.save



james_investment = Investment.new(name: "Reece James", abbreviation: "REJS", rating: rand(0..10), category: "player", description: "The best RB in the premier league", image:"https://img.chelseafc.com/image/upload/f_auto,h_390,q_90/editorial/people/first-team/2023-24/Reece_James_profile_23-24_with_sponsor_headshot-removebg.png")
james_investment.save

trent_investment = Investment.new(name: "Trent Alexander-Arnold", abbreviation: "TRAA", rating: rand(0..10), category: "player", description: "The 2nd best RB in the premier league", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p169187.png")
trent_investment.save

palmer_investment = Investment.new(name: "Cole Palmer", abbreviation: "CPLM", rating: rand(0..10), category: "player", description: "Breakthrough Chelsea player", image:"https://imagecache.365scores.com/image/upload/f_png,w_250,h_250,c_limit,q_auto:eco,d_Athletes:default.png,r_max,c_thumb,g_face,z_0.65/Athletes/78535")
palmer_investment.save

messi_investment = Investment.new(name: "Lionel Messi", abbreviation: "LOME", rating: rand(0..10), category: "player", description: "The goat", image:"https://images.mlssoccer.com/image/private/t_editorial_squared_6_desktop/f_png/mls-mia-prd/urj5ghqpk8k151t5oj9g.png")
messi_investment.save

gordon_investment = Investment.new(name: "Anthony Gordon", abbreviation: "ANGR", rating: rand(0..10), category: "player", description: "The everton boy who went to Newcastle", image:"https://www.nufc.co.uk/media/79576/anthony-gordon.png?anchor=center&mode=crop&width=350&height=460&quality=75")
gordon_investment.save

bowen_investment = Investment.new(name: "Jarrod Bowen", abbreviation: "JRBW", rating: rand(0..10), category: "player", description: "England forward with rapid pace", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p178186.png")
bowen_investment.save

cunha_investment = Investment.new(name: "Matheus Cunha", abbreviation: "MTCH", rating: rand(0..10), category: "player", description: "Brazialin who plays at wolves", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p430871.png")
cunha_investment.save

olise_investment = Investment.new(name: "Michael Olise", abbreviation: "MHOL", rating: rand(0..10), category: "player", description: "French talent", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p443661.png")
olise_investment.save

willian_investment = Investment.new(name: "Willian", abbreviation: "WILL", rating: rand(0..10), category: "player", description: "Ex chelsea giant", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p47431.png")
willian_investment.save

elanga_investment = Investment.new(name: "Anthony Elanga", abbreviation: "ANEL", rating: rand(0..10), category: "player", description: "Manchest united talent on loan", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p449434.png")
elanga_investment.save

nunez_investment = Investment.new(name: "Darwin Nunez", abbreviation: "DRNZ", rating: rand(0..10), category: "player", description: "Uruguay stricker for liverpool", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p447203.png")
nunez_investment.save

haaland_investment = Investment.new(name: "Erling Haaland", abbreviation: "ERHL", rating: rand(0..10), category: "player", description: "The norweigian beast", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p223094.png")
haaland_investment.save

james_history1 = History.create(date: Date.parse("2023-11-08"), price: 43.50, investment: james_investment)
james_history2 = History.create(date: Date.parse("2023-11-09"), price: 40.32, investment: james_investment)
james_history3 = History.create(date: Date.parse("2023-11-10"), price: 39.67, investment: james_investment)
james_history4 = History.create(date: Date.parse("2023-11-11"), price: 28.57, investment: james_investment)
james_history5 = History.create(date: Date.parse("2023-11-12"), price: 23.03, investment: james_investment)
james_history6 = History.create(date: Date.parse("2023-11-13"), price: 25.78, investment: james_investment)
james_history7 = History.create(date: Date.parse("2023-11-14"), price: 24.98, investment: james_investment)
james_history8 = History.create(date: Date.parse("2023-11-15"), price: 27.98, investment: james_investment)
james_history9 = History.create(date: Date.parse("2023-11-16"), price: 28.20, investment: james_investment)
james_history10 = History.create(date: Date.parse("2023-11-17"), price: 26.28, investment: james_investment)
james_history11 = History.create(date: Date.parse("2023-11-18"), price: 26.45, investment: james_investment)
james_history12 = History.create(date: Date.parse("2023-11-19"), price: 39.68, investment: james_investment)
james_history13 = History.create(date: Date.parse("2023-11-20"), price: 37.54, investment: james_investment)
james_history14 = History.create(date: Date.parse("2023-11-21"), price: 38.22, investment: james_investment)
james_history15 = History.create(date: Date.parse("2023-11-22"), price: 38.89, investment: james_investment)
james_history16 = History.create(date: Date.parse("2023-11-23"), price: 35.77, investment: james_investment)
james_history17 = History.create(date: Date.parse("2023-11-24"), price: 36.57, investment: james_investment)
james_history18 = History.create(date: Date.parse("2023-11-25"), price: 40.67, investment: james_investment)
james_history19 = History.create(date: Date.parse("2023-11-26"), price: 42.98, investment: james_investment)
james_history20 = History.create(date: Date.parse("2023-11-27"), price: 47.66, investment: james_investment)
james_history21 = History.create(date: Date.parse("2023-11-28"), price: 53.54, investment: james_investment)
james_history22 = History.create(date: Date.parse("2023-11-29"), price: 59.60, investment: james_investment)
james_history23 = History.create(date: Date.parse("2023-11-30"), price: 60.00, investment: james_investment)
james_history24 = History.create(date: Date.parse("2023-12-01"), price: 68.00, investment: james_investment)
james_history25 = History.create(date: Date.parse("2023-12-02"), price: 73.45, investment: james_investment)
james_history26 = History.create(date: Date.parse("2023-12-03"), price: 65.00, investment: james_investment)
james_history27 = History.create(date: Date.parse("2023-12-04"), price: 69.01, investment: james_investment)
james_history28 = History.create(date: Date.parse("2023-12-05"), price: 67.91, investment: james_investment)
james_history29 = History.create(date: Date.parse("2023-12-06"), price: 67.31, investment: james_investment)
james_history30 = History.create(date: Date.parse("2023-12-07"), price: 67.51, investment: james_investment)

trent_history1 = History.create(date: Date.parse("2023-11-08"), price: 33.6, investment: trent_investment)
trent_history2 = History.create(date: Date.parse("2023-11-09"), price: 27.6, investment: trent_investment)
trent_history3 = History.create(date: Date.parse("2023-11-10"), price: 25.6, investment: trent_investment)
trent_history4 = History.create(date: Date.parse("2023-11-11"), price: 28.0, investment: trent_investment)
trent_history5 = History.create(date: Date.parse("2023-11-12"), price: 19.0, investment: trent_investment)
trent_history6 = History.create(date: Date.parse("2023-11-13"), price: 22.78, investment: trent_investment)
trent_history7 = History.create(date: Date.parse("2023-11-14"), price: 26.98, investment: trent_investment)
trent_history8 = History.create(date: Date.parse("2023-11-15"), price: 27.98, investment: trent_investment)
trent_history9 = History.create(date: Date.parse("2023-11-16"), price: 28.20, investment: trent_investment)
trent_history10 = History.create(date: Date.parse("2023-11-17"), price: 36.28, investment: trent_investment)
trent_history11 = History.create(date: Date.parse("2023-11-18"), price: 36.45, investment: trent_investment)
trent_history12 = History.create(date: Date.parse("2023-11-19"), price: 34.68, investment: trent_investment)
trent_history13 = History.create(date: Date.parse("2023-11-20"), price: 32.54, investment: trent_investment)
trent_history14 = History.create(date: Date.parse("2023-11-21"), price: 34.22, investment: trent_investment)
trent_history15 = History.create(date: Date.parse("2023-11-22"), price: 38.89, investment: trent_investment)
trent_history16 = History.create(date: Date.parse("2023-11-23"), price: 35.77, investment: trent_investment)
trent_history17 = History.create(date: Date.parse("2023-11-24"), price: 26.57, investment: trent_investment)
trent_history18 = History.create(date: Date.parse("2023-11-25"), price: 33.67, investment: trent_investment)
trent_history19 = History.create(date: Date.parse("2023-11-26"), price: 42.98, investment: trent_investment)
trent_history20 = History.create(date: Date.parse("2023-11-27"), price: 47.66, investment: trent_investment)
trent_history21 = History.create(date: Date.parse("2023-11-28"), price: 53.54, investment: trent_investment)
trent_history22 = History.create(date: Date.parse("2023-11-29"), price: 55.60, investment: trent_investment)
trent_history23 = History.create(date: Date.parse("2023-11-30"), price: 61.00, investment: trent_investment)
trent_history24 = History.create(date: Date.parse("2023-12-01"), price: 58.00, investment: trent_investment)
trent_history25 = History.create(date: Date.parse("2023-12-02"), price: 53.45, investment: trent_investment)
trent_history26 = History.create(date: Date.parse("2023-12-03"), price: 61.00, investment: trent_investment)
trent_history27 = History.create(date: Date.parse("2023-12-04"), price: 55.01, investment: trent_investment)
trent_history28 = History.create(date: Date.parse("2023-12-05"), price: 55.21, investment: trent_investment)
trent_history29 = History.create(date: Date.parse("2023-12-06"), price: 56.88, investment: trent_investment)
trent_history30 = History.create(date: Date.parse("2023-12-07"), price: 56.44, investment: trent_investment)

palmer_history1 = History.create(date: Date.parse("2023-11-08"), price: 8.6, investment: palmer_investment)
palmer_history2 = History.create(date: Date.parse("2023-11-09"), price: 10.6, investment: palmer_investment)
palmer_history3 = History.create(date: Date.parse("2023-11-10"), price: 13.2, investment: palmer_investment)
palmer_history4 = History.create(date: Date.parse("2023-11-11"), price: 13.5, investment: palmer_investment)
palmer_history5 = History.create(date: Date.parse("2023-11-12"), price: 16.5, investment: palmer_investment)
palmer_history6 = History.create(date: Date.parse("2023-11-13"), price: 25.78, investment: palmer_investment)
palmer_history7 = History.create(date: Date.parse("2023-11-14"), price: 24.98, investment: palmer_investment)
palmer_history8 = History.create(date: Date.parse("2023-11-15"), price: 27.98, investment: palmer_investment)
palmer_history9 = History.create(date: Date.parse("2023-11-16"), price: 28.20, investment: palmer_investment)
palmer_history10 = History.create(date: Date.parse("2023-11-17"), price: 26.28, investment: palmer_investment)
palmer_history11 = History.create(date: Date.parse("2023-11-18"), price: 26.45, investment: palmer_investment)
palmer_history12 = History.create(date: Date.parse("2023-11-19"), price: 34.68, investment: palmer_investment)
palmer_history13 = History.create(date: Date.parse("2023-11-20"), price: 32.54, investment: palmer_investment)
palmer_history14 = History.create(date: Date.parse("2023-11-21"), price: 34.22, investment: palmer_investment)
palmer_history15 = History.create(date: Date.parse("2023-11-22"), price: 38.89, investment: palmer_investment)
palmer_history16 = History.create(date: Date.parse("2023-11-23"), price: 35.77, investment: palmer_investment)
palmer_history17 = History.create(date: Date.parse("2023-11-24"), price: 36.57, investment: palmer_investment)
palmer_history18 = History.create(date: Date.parse("2023-11-25"), price: 40.67, investment: palmer_investment)
palmer_history19 = History.create(date: Date.parse("2023-11-26"), price: 42.98, investment: palmer_investment)
palmer_history20 = History.create(date: Date.parse("2023-11-27"), price: 47.66, investment: palmer_investment)
palmer_history21 = History.create(date: Date.parse("2023-11-28"), price: 53.54, investment: palmer_investment)
palmer_history22 = History.create(date: Date.parse("2023-11-29"), price: 59.60, investment: palmer_investment)
palmer_history23 = History.create(date: Date.parse("2023-11-30"), price: 60.00, investment: palmer_investment)
palmer_history24 = History.create(date: Date.parse("2023-12-01"), price: 48.00, investment: palmer_investment)
palmer_history25 = History.create(date: Date.parse("2023-12-02"), price: 50.45, investment: palmer_investment)
palmer_history26 = History.create(date: Date.parse("2023-12-03"), price: 45.00, investment: palmer_investment)
palmer_history27 = History.create(date: Date.parse("2023-12-04"), price: 49.01, investment: palmer_investment)
palmer_history28 = History.create(date: Date.parse("2023-12-05"), price: 51.01, investment: palmer_investment)
palmer_history29 = History.create(date: Date.parse("2023-12-06"), price: 51.19, investment: palmer_investment)
palmer_history30 = History.create(date: Date.parse("2023-12-07"), price: 51.29, investment: palmer_investment)


messi_history1 = History.create(date: Date.parse("2023-11-08"), price: 200.4, investment: messi_investment)
messi_history2 = History.create(date: Date.parse("2023-11-09"), price: 235.3, investment: messi_investment)
messi_history3 = History.create(date: Date.parse("2023-11-10"), price: 222.4, investment: messi_investment)
messi_history4 = History.create(date: Date.parse("2023-11-11"), price: 234.0, investment: messi_investment)
messi_history5 = History.create(date: Date.parse("2023-11-12"), price: 236.0, investment: messi_investment)
messi_history6 = History.create(date: Date.parse("2023-11-13"), price: 230.45, investment: messi_investment)
messi_history7 = History.create(date: Date.parse("2023-11-14"), price: 226.32, investment: messi_investment)
messi_history8 = History.create(date: Date.parse("2023-11-15"), price: 219.45, investment: messi_investment)
messi_history9 = History.create(date: Date.parse("2023-11-16"), price: 206.98, investment: messi_investment)
messi_history10 = History.create(date: Date.parse("2023-11-17"), price: 207.56, investment: messi_investment)
messi_history11 = History.create(date: Date.parse("2023-11-18"), price: 206.99, investment: messi_investment)
messi_history12 = History.create(date: Date.parse("2023-11-19"), price: 207.45, investment: messi_investment)
messi_history13 = History.create(date: Date.parse("2023-11-20"), price: 220.34, investment: messi_investment)
messi_history14 = History.create(date: Date.parse("2023-11-21"), price: 190.45, investment: messi_investment)
messi_history15 = History.create(date: Date.parse("2023-11-22"), price: 185.68, investment: messi_investment)
messi_history16 = History.create(date: Date.parse("2023-11-23"), price: 213.54, investment: messi_investment)
messi_history17 = History.create(date: Date.parse("2023-11-24"), price: 235.3, investment: messi_investment)
messi_history18 = History.create(date: Date.parse("2023-11-25"), price: 244.45, investment: messi_investment)
messi_history19 = History.create(date: Date.parse("2023-11-26"), price: 245.14, investment: messi_investment)
messi_history20 = History.create(date: Date.parse("2023-11-27"), price: 238.62, investment: messi_investment)
messi_history21 = History.create(date: Date.parse("2023-11-28"), price: 240.58, investment: messi_investment)
messi_history22 = History.create(date: Date.parse("2023-11-29"), price: 241.34, investment: messi_investment)
messi_history23 = History.create(date: Date.parse("2023-11-30"), price: 243.56, investment: messi_investment)
messi_history24 = History.create(date: Date.parse("2023-12-01"), price: 245.87, investment: messi_investment)
messi_history25 = History.create(date: Date.parse("2023-12-02"), price: 245.01, investment: messi_investment)
messi_history26 = History.create(date: Date.parse("2023-12-03"), price: 246.76, investment: messi_investment)
messi_history27 = History.create(date: Date.parse("2023-12-04"), price: 258.87, investment: messi_investment)
messi_history28 = History.create(date: Date.parse("2023-12-05"), price: 256.24, investment: messi_investment)
messi_history29 = History.create(date: Date.parse("2023-12-06"), price: 254.69, investment: messi_investment)
messi_history30 = History.create(date: Date.parse("2023-12-07"), price: 255.69, investment: messi_investment)

gordon_history1 = History.create(date: Date.parse("2023-11-08"), price: 11.4, investment: gordon_investment)
gordon_history2 = History.create(date: Date.parse("2023-11-09"), price: 12.3, investment: gordon_investment)
gordon_history3 = History.create(date: Date.parse("2023-11-10"), price: 9.4, investment: gordon_investment)
gordon_history4 = History.create(date: Date.parse("2023-11-11"), price: 10.5, investment: gordon_investment)
gordon_history5 = History.create(date: Date.parse("2023-11-12"), price: 12.5, investment: gordon_investment)
gordon_history6 = History.create(date: Date.parse("2023-11-13"), price: 25.78, investment: gordon_investment)
gordon_history7 = History.create(date: Date.parse("2023-11-14"), price: 24.98, investment: gordon_investment)
gordon_history8 = History.create(date: Date.parse("2023-11-15"), price: 27.98, investment: gordon_investment)
gordon_history9 = History.create(date: Date.parse("2023-11-16"), price: 28.20, investment: gordon_investment)
gordon_history10 = History.create(date: Date.parse("2023-11-17"), price: 26.28, investment: gordon_investment)
gordon_history11 = History.create(date: Date.parse("2023-11-18"), price: 26.45, investment: gordon_investment)
gordon_history12 = History.create(date: Date.parse("2023-11-19"), price: 34.68, investment: gordon_investment)
gordon_history13 = History.create(date: Date.parse("2023-11-20"), price: 32.54, investment: gordon_investment)
gordon_history14 = History.create(date: Date.parse("2023-11-21"), price: 34.22, investment: gordon_investment)
gordon_history15 = History.create(date: Date.parse("2023-11-22"), price: 38.89, investment: gordon_investment)
gordon_history16 = History.create(date: Date.parse("2023-11-23"), price: 35.77, investment: gordon_investment)
gordon_history17 = History.create(date: Date.parse("2023-11-24"), price: 36.57, investment: gordon_investment)
gordon_history18 = History.create(date: Date.parse("2023-11-25"), price: 40.67, investment: gordon_investment)
gordon_history19 = History.create(date: Date.parse("2023-11-26"), price: 42.98, investment: gordon_investment)
gordon_history20 = History.create(date: Date.parse("2023-11-27"), price: 47.66, investment: gordon_investment)
gordon_history21 = History.create(date: Date.parse("2023-11-28"), price: 33.54, investment: gordon_investment)
gordon_history22 = History.create(date: Date.parse("2023-11-29"), price: 39.60, investment: gordon_investment)
gordon_history23 = History.create(date: Date.parse("2023-11-30"), price: 30.00, investment: gordon_investment)
gordon_history24 = History.create(date: Date.parse("2023-12-01"), price: 38.00, investment: gordon_investment)
gordon_history25 = History.create(date: Date.parse("2023-12-02"), price: 43.45, investment: gordon_investment)
gordon_history26 = History.create(date: Date.parse("2023-12-03"), price: 33.00, investment: gordon_investment)
gordon_history27 = History.create(date: Date.parse("2023-12-04"), price: 37.01, investment: gordon_investment)
gordon_history28 = History.create(date: Date.parse("2023-12-05"), price: 37.61, investment: gordon_investment)
gordon_history29 = History.create(date: Date.parse("2023-12-06"), price: 35.99, investment: gordon_investment)
gordon_history30 = History.create(date: Date.parse("2023-12-07"), price: 35.19, investment: gordon_investment)


bowen_history1 = History.create(date: Date.parse("2023-11-08"), price: 15.4, investment: bowen_investment)
bowen_history2 = History.create(date: Date.parse("2023-11-09"), price: 16.3, investment: bowen_investment)
bowen_history3 = History.create(date: Date.parse("2023-11-10"), price: 34.4, investment: bowen_investment)
bowen_history4 = History.create(date: Date.parse("2023-11-11"), price: 35.5, investment: bowen_investment)
bowen_history5 = History.create(date: Date.parse("2023-11-12"), price: 37.5, investment: bowen_investment)
bowen_history6 = History.create(date: Date.parse("2023-11-13"), price: 35.78, investment: bowen_investment)
bowen_history7 = History.create(date: Date.parse("2023-11-14"), price: 29.98, investment: bowen_investment)
bowen_history8 = History.create(date: Date.parse("2023-11-15"), price: 25.98, investment: bowen_investment)
bowen_history9 = History.create(date: Date.parse("2023-11-16"), price: 28.20, investment: bowen_investment)
bowen_history10 = History.create(date: Date.parse("2023-11-17"), price: 26.28, investment: bowen_investment)
bowen_history11 = History.create(date: Date.parse("2023-11-18"), price: 26.45, investment: bowen_investment)
bowen_history12 = History.create(date: Date.parse("2023-11-19"), price: 34.68, investment: bowen_investment)
bowen_history13 = History.create(date: Date.parse("2023-11-20"), price: 32.54, investment: bowen_investment)
bowen_history14 = History.create(date: Date.parse("2023-11-21"), price: 34.22, investment: bowen_investment)
bowen_history15 = History.create(date: Date.parse("2023-11-22"), price: 39.89, investment: bowen_investment)
bowen_history16 = History.create(date: Date.parse("2023-11-23"), price: 35.77, investment: bowen_investment)
bowen_history17 = History.create(date: Date.parse("2023-11-24"), price: 36.57, investment: bowen_investment)
bowen_history18 = History.create(date: Date.parse("2023-11-25"), price: 40.67, investment: bowen_investment)
bowen_history19 = History.create(date: Date.parse("2023-11-26"), price: 42.98, investment: bowen_investment)
bowen_history20 = History.create(date: Date.parse("2023-11-27"), price: 41.66, investment: bowen_investment)
bowen_history21 = History.create(date: Date.parse("2023-11-28"), price: 53.54, investment: bowen_investment)
bowen_history22 = History.create(date: Date.parse("2023-11-29"), price: 59.60, investment: bowen_investment)
bowen_history23 = History.create(date: Date.parse("2023-11-30"), price: 65.00, investment: bowen_investment)
bowen_history24 = History.create(date: Date.parse("2023-12-01"), price: 68.00, investment: bowen_investment)
bowen_history25 = History.create(date: Date.parse("2023-12-02"), price: 65.45, investment: bowen_investment)
bowen_history26 = History.create(date: Date.parse("2023-12-03"), price: 62.00, investment: bowen_investment)
bowen_history27 = History.create(date: Date.parse("2023-12-04"), price: 64.01, investment: bowen_investment)
bowen_history28 = History.create(date: Date.parse("2023-12-05"), price: 65.32, investment: bowen_investment)
bowen_history29 = History.create(date: Date.parse("2023-12-06"), price: 66.86, investment: bowen_investment)
bowen_history30 = History.create(date: Date.parse("2023-12-07"), price: 66.96, investment: bowen_investment)

cunha_history1 = History.create(date: Date.parse("2023-11-08"), price: 9.2, investment: cunha_investment)
cunha_history2 = History.create(date: Date.parse("2023-11-09"), price: 9.8, investment: cunha_investment)
cunha_history3 = History.create(date: Date.parse("2023-11-10"), price: 9.9, investment: cunha_investment)
cunha_history4 = History.create(date: Date.parse("2023-11-11"), price: 10.0, investment: cunha_investment)
cunha_history5 = History.create(date: Date.parse("2023-11-12"), price: 14.0, investment: cunha_investment)
cunha_history6 = History.create(date: Date.parse("2023-11-13"), price: 25.78, investment: cunha_investment)
cunha_history7 = History.create(date: Date.parse("2023-11-14"), price: 22.98, investment: cunha_investment)
cunha_history8 = History.create(date: Date.parse("2023-11-15"), price: 28.98, investment: cunha_investment)
cunha_history9 = History.create(date: Date.parse("2023-11-16"), price: 30.20, investment: cunha_investment)
cunha_history10 = History.create(date: Date.parse("2023-11-17"), price: 25.28, investment: cunha_investment)
cunha_history11 = History.create(date: Date.parse("2023-11-18"), price: 27.45, investment: cunha_investment)
cunha_history12 = History.create(date: Date.parse("2023-11-19"), price: 31.68, investment: cunha_investment)
cunha_history13 = History.create(date: Date.parse("2023-11-20"), price: 26.54, investment: cunha_investment)
cunha_history14 = History.create(date: Date.parse("2023-11-21"), price: 28.22, investment: cunha_investment)
cunha_history15 = History.create(date: Date.parse("2023-11-22"), price: 33.89, investment: cunha_investment)
cunha_history16 = History.create(date: Date.parse("2023-11-23"), price: 35.77, investment: cunha_investment)
cunha_history17 = History.create(date: Date.parse("2023-11-24"), price: 36.57, investment: cunha_investment)
cunha_history18 = History.create(date: Date.parse("2023-11-25"), price: 30.67, investment: cunha_investment)
cunha_history19 = History.create(date: Date.parse("2023-11-26"), price: 32.98, investment: cunha_investment)
cunha_history20 = History.create(date: Date.parse("2023-11-27"), price: 27.66, investment: cunha_investment)
cunha_history21 = History.create(date: Date.parse("2023-11-28"), price: 35.54, investment: cunha_investment)
cunha_history22 = History.create(date: Date.parse("2023-11-29"), price: 39.60, investment: cunha_investment)
cunha_history23 = History.create(date: Date.parse("2023-11-30"), price: 31.00, investment: cunha_investment)
cunha_history24 = History.create(date: Date.parse("2023-12-01"), price: 38.00, investment: cunha_investment)
cunha_history25 = History.create(date: Date.parse("2023-12-02"), price: 33.45, investment: cunha_investment)
cunha_history26 = History.create(date: Date.parse("2023-12-03"), price: 30.00, investment: cunha_investment)
cunha_history27 = History.create(date: Date.parse("2023-12-04"), price: 37.51, investment: cunha_investment)
cunha_history28 = History.create(date: Date.parse("2023-12-05"), price: 35.87, investment: cunha_investment)
cunha_history29 = History.create(date: Date.parse("2023-12-06"), price: 36.43, investment: cunha_investment)
cunha_history30 = History.create(date: Date.parse("2023-12-07"), price: 36.03, investment: cunha_investment)

olise_history1 = History.create(date: Date.parse("2023-11-08"), price: 21.2, investment: olise_investment)
olise_history2 = History.create(date: Date.parse("2023-11-09"), price: 19.8, investment: olise_investment)
olise_history3 = History.create(date: Date.parse("2023-11-10"), price: 19.9, investment: olise_investment)
olise_history4 = History.create(date: Date.parse("2023-11-11"), price: 19.5, investment: olise_investment)
olise_history5 = History.create(date: Date.parse("2023-11-12"), price: 21.5, investment: olise_investment)
olise_history6 = History.create(date: Date.parse("2023-11-13"), price: 25.78, investment: olise_investment)
olise_history7 = History.create(date: Date.parse("2023-11-14"), price: 24.98, investment: olise_investment)
olise_history8 = History.create(date: Date.parse("2023-11-15"), price: 27.98, investment: olise_investment)
olise_history9 = History.create(date: Date.parse("2023-11-16"), price: 28.20, investment: olise_investment)
olise_history10 = History.create(date: Date.parse("2023-11-17"), price: 26.28, investment: olise_investment)
olise_history11 = History.create(date: Date.parse("2023-11-18"), price: 26.45, investment: olise_investment)
olise_history12 = History.create(date: Date.parse("2023-11-19"), price: 34.68, investment: olise_investment)
olise_history13 = History.create(date: Date.parse("2023-11-20"), price: 32.54, investment: olise_investment)
olise_history14 = History.create(date: Date.parse("2023-11-21"), price: 34.22, investment: olise_investment)
olise_history15 = History.create(date: Date.parse("2023-11-22"), price: 35.89, investment: olise_investment)
olise_history16 = History.create(date: Date.parse("2023-11-23"), price: 32.77, investment: olise_investment)
olise_history17 = History.create(date: Date.parse("2023-11-24"), price: 39.57, investment: olise_investment)
olise_history18 = History.create(date: Date.parse("2023-11-25"), price: 33.67, investment: olise_investment)
olise_history19 = History.create(date: Date.parse("2023-11-26"), price: 42.98, investment: olise_investment)
olise_history20 = History.create(date: Date.parse("2023-11-27"), price: 47.66, investment: olise_investment)
olise_history21 = History.create(date: Date.parse("2023-11-28"), price: 43.54, investment: olise_investment)
olise_history22 = History.create(date: Date.parse("2023-11-29"), price: 39.60, investment: olise_investment)
olise_history23 = History.create(date: Date.parse("2023-11-30"), price: 60.00, investment: olise_investment)
olise_history24 = History.create(date: Date.parse("2023-12-01"), price: 58.00, investment: olise_investment)
olise_history25 = History.create(date: Date.parse("2023-12-02"), price: 53.45, investment: olise_investment)
olise_history26 = History.create(date: Date.parse("2023-12-03"), price: 50.00, investment: olise_investment)
olise_history27 = History.create(date: Date.parse("2023-12-04"), price: 39.01, investment: olise_investment)
olise_history28 = History.create(date: Date.parse("2023-12-05"), price: 43.11, investment: olise_investment)
olise_history29 = History.create(date: Date.parse("2023-12-06"), price: 43.19, investment: olise_investment)
olise_history30 = History.create(date: Date.parse("2023-12-07"), price: 43.94, investment: olise_investment)

willian_history1 = History.create(date: Date.parse("2023-11-08"), price: 22.2, investment: willian_investment)
willian_history2 = History.create(date: Date.parse("2023-11-09"), price: 22.8, investment: willian_investment)
willian_history3 = History.create(date: Date.parse("2023-11-10"), price: 23.9, investment: willian_investment)
willian_history4 = History.create(date: Date.parse("2023-11-11"), price: 13.0, investment: willian_investment)
willian_history5 = History.create(date: Date.parse("2023-11-12"), price: 14.0, investment: willian_investment)
willian_history6 = History.create(date: Date.parse("2023-11-13"), price: 25.78, investment: willian_investment)
willian_history7 = History.create(date: Date.parse("2023-11-14"), price: 29.98, investment: willian_investment)
willian_history8 = History.create(date: Date.parse("2023-11-15"), price: 17.98, investment: willian_investment)
willian_history9 = History.create(date: Date.parse("2023-11-16"), price: 18.20, investment: willian_investment)
willian_history10 = History.create(date: Date.parse("2023-11-17"), price: 31.28, investment: willian_investment)
willian_history11 = History.create(date: Date.parse("2023-11-18"), price: 26.45, investment: willian_investment)
willian_history12 = History.create(date: Date.parse("2023-11-19"), price: 34.68, investment: willian_investment)
willian_history13 = History.create(date: Date.parse("2023-11-20"), price: 32.54, investment: willian_investment)
willian_history14 = History.create(date: Date.parse("2023-11-21"), price: 24.22, investment: willian_investment)
willian_history15 = History.create(date: Date.parse("2023-11-22"), price: 28.89, investment: willian_investment)
willian_history16 = History.create(date: Date.parse("2023-11-23"), price: 25.77, investment: willian_investment)
willian_history17 = History.create(date: Date.parse("2023-11-24"), price: 26.57, investment: willian_investment)
willian_history18 = History.create(date: Date.parse("2023-11-25"), price: 10.67, investment: willian_investment)
willian_history19 = History.create(date: Date.parse("2023-11-26"), price: 12.98, investment: willian_investment)
willian_history20 = History.create(date: Date.parse("2023-11-27"), price: 17.66, investment: willian_investment)
willian_history21 = History.create(date: Date.parse("2023-11-28"), price: 23.54, investment: willian_investment)
willian_history22 = History.create(date: Date.parse("2023-11-29"), price: 19.60, investment: willian_investment)
willian_history23 = History.create(date: Date.parse("2023-11-30"), price: 20.00, investment: willian_investment)
willian_history24 = History.create(date: Date.parse("2023-12-01"), price: 18.00, investment: willian_investment)
willian_history25 = History.create(date: Date.parse("2023-12-02"), price: 23.45, investment: willian_investment)
willian_history26 = History.create(date: Date.parse("2023-12-03"), price: 20.00, investment: willian_investment)
willian_history27 = History.create(date: Date.parse("2023-12-04"), price: 19.01, investment: willian_investment)
willian_history28 = History.create(date: Date.parse("2023-12-05"), price: 20.63, investment: willian_investment)
willian_history29 = History.create(date: Date.parse("2023-12-06"), price: 23.45, investment: willian_investment)
willian_history30 = History.create(date: Date.parse("2023-12-07"), price: 23.52, investment: willian_investment)

elanga_history1 = History.create(date: Date.parse("2023-11-08"), price: 5.2, investment: elanga_investment)
elanga_history2 = History.create(date: Date.parse("2023-11-09"), price: 5.8, investment: elanga_investment)
elanga_history3 = History.create(date: Date.parse("2023-11-10"), price: 5.9, investment: elanga_investment)
elanga_history4 = History.create(date: Date.parse("2023-11-11"), price: 6.0, investment: elanga_investment)
elanga_history5 = History.create(date: Date.parse("2023-11-12"), price: 4.0, investment: elanga_investment)
elanga_history6 = History.create(date: Date.parse("2023-11-13"), price: 25.78, investment: elanga_investment)
elanga_history7 = History.create(date: Date.parse("2023-11-14"), price: 24.98, investment: elanga_investment)
elanga_history8 = History.create(date: Date.parse("2023-11-15"), price: 27.98, investment: elanga_investment)
elanga_history9 = History.create(date: Date.parse("2023-11-16"), price: 28.20, investment: elanga_investment)
elanga_history10 = History.create(date: Date.parse("2023-11-17"), price: 26.28, investment: elanga_investment)
elanga_history11 = History.create(date: Date.parse("2023-11-18"), price: 26.45, investment: elanga_investment)
elanga_history12 = History.create(date: Date.parse("2023-11-19"), price: 34.68, investment: elanga_investment)
elanga_history13 = History.create(date: Date.parse("2023-11-20"), price: 22.54, investment: elanga_investment)
elanga_history14 = History.create(date: Date.parse("2023-11-21"), price: 34.22, investment: elanga_investment)
elanga_history15 = History.create(date: Date.parse("2023-11-22"), price: 38.89, investment: elanga_investment)
elanga_history16 = History.create(date: Date.parse("2023-11-23"), price: 25.77, investment: elanga_investment)
elanga_history17 = History.create(date: Date.parse("2023-11-24"), price: 36.57, investment: elanga_investment)
elanga_history18 = History.create(date: Date.parse("2023-11-25"), price: 30.67, investment: elanga_investment)
elanga_history19 = History.create(date: Date.parse("2023-11-26"), price: 42.98, investment: elanga_investment)
elanga_history20 = History.create(date: Date.parse("2023-11-27"), price: 27.66, investment: elanga_investment)
elanga_history21 = History.create(date: Date.parse("2023-11-28"), price: 53.54, investment: elanga_investment)
elanga_history22 = History.create(date: Date.parse("2023-11-29"), price: 59.60, investment: elanga_investment)
elanga_history23 = History.create(date: Date.parse("2023-11-30"), price: 60.00, investment: elanga_investment)
elanga_history24 = History.create(date: Date.parse("2023-12-01"), price: 68.00, investment: elanga_investment)
elanga_history25 = History.create(date: Date.parse("2023-12-02"), price: 43.45, investment: elanga_investment)
elanga_history26 = History.create(date: Date.parse("2023-12-03"), price: 40.00, investment: elanga_investment)
elanga_history27 = History.create(date: Date.parse("2023-12-04"), price: 29.01, investment: elanga_investment)
elanga_history28 = History.create(date: Date.parse("2023-12-05"), price: 31.74, investment: elanga_investment)
elanga_history29 = History.create(date: Date.parse("2023-12-06"), price: 33.82, investment: elanga_investment)
elanga_history30 = History.create(date: Date.parse("2023-12-07"), price: 34.82, investment: elanga_investment)

nunez_history1 = History.create(date: Date.parse("2023-11-08"), price: 19.2, investment: nunez_investment)
nunez_history2 = History.create(date: Date.parse("2023-11-09"), price: 15.8, investment: nunez_investment)
nunez_history3 = History.create(date: Date.parse("2023-11-10"), price: 17.9, investment: nunez_investment)
nunez_history4 = History.create(date: Date.parse("2023-11-11"), price: 8.0, investment: nunez_investment)
nunez_history5 = History.create(date: Date.parse("2023-11-12"), price: 13.0, investment: nunez_investment)
nunez_history6 = History.create(date: Date.parse("2023-11-13"), price: 20.78, investment: nunez_investment)
nunez_history7 = History.create(date: Date.parse("2023-11-14"), price: 24.98, investment: nunez_investment)
nunez_history8 = History.create(date: Date.parse("2023-11-15"), price: 27.98, investment: nunez_investment)
nunez_history9 = History.create(date: Date.parse("2023-11-16"), price: 38.20, investment: nunez_investment)
nunez_history10 = History.create(date: Date.parse("2023-11-17"), price: 30.28, investment: nunez_investment)
nunez_history11 = History.create(date: Date.parse("2023-11-18"), price: 26.45, investment: nunez_investment)
nunez_history12 = History.create(date: Date.parse("2023-11-19"), price: 34.68, investment: nunez_investment)
nunez_history13 = History.create(date: Date.parse("2023-11-20"), price: 32.54, investment: nunez_investment)
nunez_history14 = History.create(date: Date.parse("2023-11-21"), price: 34.22, investment: nunez_investment)
nunez_history15 = History.create(date: Date.parse("2023-11-22"), price: 38.89, investment: nunez_investment)
nunez_history16 = History.create(date: Date.parse("2023-11-23"), price: 35.77, investment: nunez_investment)
nunez_history17 = History.create(date: Date.parse("2023-11-24"), price: 36.57, investment: nunez_investment)
nunez_history18 = History.create(date: Date.parse("2023-11-25"), price: 40.67, investment: nunez_investment)
nunez_history19 = History.create(date: Date.parse("2023-11-26"), price: 42.98, investment: nunez_investment)
nunez_history20 = History.create(date: Date.parse("2023-11-27"), price: 47.66, investment: nunez_investment)
nunez_history21 = History.create(date: Date.parse("2023-11-28"), price: 53.54, investment: nunez_investment)
nunez_history22 = History.create(date: Date.parse("2023-11-29"), price: 59.60, investment: nunez_investment)
nunez_history23 = History.create(date: Date.parse("2023-11-30"), price: 60.00, investment: nunez_investment)
nunez_history24 = History.create(date: Date.parse("2023-12-01"), price: 68.00, investment: nunez_investment)
nunez_history25 = History.create(date: Date.parse("2023-12-02"), price: 63.45, investment: nunez_investment)
nunez_history26 = History.create(date: Date.parse("2023-12-03"), price: 69.00, investment: nunez_investment)
nunez_history27 = History.create(date: Date.parse("2023-12-04"), price: 54.01, investment: nunez_investment)
nunez_history28 = History.create(date: Date.parse("2023-12-05"), price: 56.37, investment: nunez_investment)
nunez_history29 = History.create(date: Date.parse("2023-12-06"), price: 55.04, investment: nunez_investment)
nunez_history30 = History.create(date: Date.parse("2023-12-07"), price: 54.04, investment: nunez_investment)

haaland_history1 = History.create(date: Date.parse("2023-11-08"), price: 85.2, investment: haaland_investment)
haaland_history2 = History.create(date: Date.parse("2023-11-09"), price: 85.8, investment: haaland_investment)
haaland_history3 = History.create(date: Date.parse("2023-11-10"), price: 87.9, investment: haaland_investment)
haaland_history4 = History.create(date: Date.parse("2023-11-11"), price: 88.0, investment: haaland_investment)
haaland_history5 = History.create(date: Date.parse("2023-11-12"), price: 100.4, investment: haaland_investment)
haaland_history6 = History.create(date: Date.parse("2023-11-13"), price: 105.78, investment: haaland_investment)
haaland_history7 = History.create(date: Date.parse("2023-11-14"), price: 109.98, investment: haaland_investment)
haaland_history8 = History.create(date: Date.parse("2023-11-15"), price: 112.98, investment: haaland_investment)
haaland_history9 = History.create(date: Date.parse("2023-11-16"), price: 113.20, investment: haaland_investment)
haaland_history10 = History.create(date: Date.parse("2023-11-17"), price: 116.28, investment: haaland_investment)
haaland_history11 = History.create(date: Date.parse("2023-11-18"), price: 123.45, investment: haaland_investment)
haaland_history12 = History.create(date: Date.parse("2023-11-19"), price: 124.68, investment: haaland_investment)
haaland_history13 = History.create(date: Date.parse("2023-11-20"), price: 123.54, investment: haaland_investment)
haaland_history14 = History.create(date: Date.parse("2023-11-21"), price: 125.22, investment: haaland_investment)
haaland_history15 = History.create(date: Date.parse("2023-11-22"), price: 132.89, investment: haaland_investment)
haaland_history16 = History.create(date: Date.parse("2023-11-23"), price: 133.77, investment: haaland_investment)
haaland_history17 = History.create(date: Date.parse("2023-11-24"), price: 136.57, investment: haaland_investment)
haaland_history18 = History.create(date: Date.parse("2023-11-25"), price: 134.67, investment: haaland_investment)
haaland_history19 = History.create(date: Date.parse("2023-11-26"), price: 132.98, investment: haaland_investment)
haaland_history20 = History.create(date: Date.parse("2023-11-27"), price: 139.66, investment: haaland_investment)
haaland_history21 = History.create(date: Date.parse("2023-11-28"), price: 145.54, investment: haaland_investment)
haaland_history22 = History.create(date: Date.parse("2023-11-29"), price: 152.60, investment: haaland_investment)
haaland_history23 = History.create(date: Date.parse("2023-11-30"), price: 159.00, investment: haaland_investment)
haaland_history24 = History.create(date: Date.parse("2023-12-01"), price: 162.46, investment: haaland_investment)
haaland_history25 = History.create(date: Date.parse("2023-12-02"), price: 159.45, investment: haaland_investment)
haaland_history26 = History.create(date: Date.parse("2023-12-03"), price: 157.00, investment: haaland_investment)
haaland_history27 = History.create(date: Date.parse("2023-12-04"), price: 169.01, investment: haaland_investment)
haaland_history28 = History.create(date: Date.parse("2023-12-05"), price: 168.63, investment: haaland_investment)
haaland_history29 = History.create(date: Date.parse("2023-12-06"), price: 172.01, investment: haaland_investment)
haaland_history30 = History.create(date: Date.parse("2023-12-07"), price: 173.01, investment: haaland_investment)


puts "Investments created"

james = Player.new(investment: james_investment, position: "Right Back", club: "Chelsea", height: 180, weight: 80, dob: Date.parse("2000-02-20"), nationality: "England", games_played: 279, goals: 20, assists: 38, pace: 80, shooting: 72, passing: 83, dribbling: 82, defensive: 82, physics: 81)
james.save
trent = Player.new(investment: trent_investment, position: "Right Back", club: "Liverpool", height: 190, weight: 70, dob: Date.parse("1998-06-19"), nationality: "England", games_played: 309, goals: 22, assists: 80, pace: 76, shooting: 69, passing: 90, dribbling: 79, defensive: 80, physics: 73)
trent.save
palmer = Player.new(investment: palmer_investment, position: "Attacking Midfield", club: "Chealsea", height: 189, weight: 74, dob: Date.parse("2002-5-6"), nationality: "England", games_played: 118, goals: 52, assists: 25, pace: 74, shooting: 66, passing: 62, dribbling: 70, defensive: 46, physics: 57)
palmer.save
messi = Player.new(investment: messi_investment, position: "Right Winger", club: "Inter Miami", height: 170, weight: 72, dob: Date.parse("1987-06-24"), nationality: "Argentina", games_played: 889, goals: 721, assists: 344, pace: 80, shooting: 87, passing: 90, dribbling: 94, defensive: 33, physics: 64)
messi.save
haaland = Player.new(investment: haaland_investment, position: "Centre-Forward", club: "Manchester City", height: 195, weight: 88, dob: Date.parse("2000-07-23"), nationality: "Norway", games_played: 257, goals: 206, assists: 50, pace: 89, shooting: 93, passing: 66, dribbling: 80, defensive: 45, physics: 88)
haaland.save
gordon = Player.new(investment: gordon_investment, position: "Left Winger", club: "Newcastle United", height: 182, weight: 72, dob: Date.parse("2001-02-24"), nationality: "England", games_played: 185, goals: 38, assists: 23, pace: 88, shooting: 69, passing: 72, dribbling: 75, defensive: 37, physics: 62)
gordon.save
olise = Player.new(investment: olise_investment, position: "Right Winger", club: "Crytal Palace F.C.", height: 184, weight: 76, dob: Date.parse("2001-12-12"), nationality: "France", games_played: 182, goals: 22, assists: 38, pace: 80, shooting: 70, passing: 77, dribbling: 83, defensive: 50, physics: 56)
olise.save
elanga = Player.new(investment: elanga_investment, position: "Left Winger", club: "Nottingham Forest", height: 178, weight: 70, dob: Date.parse("2002-04-27"), nationality: "Sweden", games_played: 139, goals: 33, assists: 23, pace: 87, shooting: 66, passing: 64, dribbling: 73, defensive: 38, physics: 58)
elanga.save
bowen = Player.new(investment: bowen_investment, position: "Right Winger", club: "West Ham United", height: 182, weight: 70, dob: Date.parse("1996-12-20"), nationality: "England", games_played: 314, goals: 104, assists: 49, pace: 77, shooting: 77, passing: 74, dribbling: 80, defensive: 44, physics: 66)
bowen.save
cunha = Player.new(investment: cunha_investment, position: "Centre-Forward", club: "Wolves", height: 183, weight: 76, dob: Date.parse("1999-05-27"), nationality: "Brazil", games_played: 214, goals: 45, assists: 32, pace: 88, shooting: 78, passing: 75, dribbling: 82, defensive: 40, physics: 73 )
cunha.save
willian = Player.new(investment: willian_investment, position: "Left Winger", club: "Fulham", height: 175, weight: 77, dob: Date.parse("1988-08-09"), nationality: "Brazil", games_played: 723, goals: 113, assists: 152, pace: 72, shooting: 77, passing: 77, dribbling: 81, defensive: 49, physics: 55)
willian.save
nunez = Player.new(investment: nunez_investment, position: "Centre-Forward", club: "FC Liverpool", height: 187, weight: 81, dob: Date.parse("1999-06-24"), nationality: "Uruguay", games_played: 201, goals: 90, assists: 30, pace: 90, shooting: 81, passing: 71, dribbling: 76, defensive: 43, physics: 85)
nunez.save
puts "Players created"



# Holding.new(user: User.first, investment: Investment.first, purchased_price: Investment.first.histories[Investment.first.histories.length - 1].price, purchased_date: Date.yesterday, shares_amount: 10, trade: "buy")
# u -= User.first.tokens - Holding.first.purchased_price * Holding.first.shares_amount
# u.save
# Seed the user history for the first user with 2 purchases
nov_30 = Investment.last.histories[Investment.first.histories.length - 5]
dec_02 = Investment.first.histories[Investment.first.histories.length - 3]

holding_1 = Holding.create(user: User.first, investment: Investment.first, purchased_price: dec_02.price, purchased_date: dec_02.date, shares_amount: 10, trade: "buy")
trade_history_1 = TradeHistory.create(user: holding_1.user, holding: holding_1, date: dec_02.date, shares_amount: holding_1.shares_amount)

holding_2 = Holding.create(user: User.first, investment: Investment.last, purchased_price: nov_30.price, purchased_date: nov_30.date, shares_amount: 20, trade: "buy")
trade_history_2 = TradeHistory.create(user: holding_2.user, holding: holding_2, date: nov_30.date, shares_amount: holding_2.shares_amount)

user_1 = User.first
user_first_purchased_on = user_1.holdings.all.order(purchased_date: :ASC).first.purchased_date
dates = (user_first_purchased_on..Date.today)

tokens = 5000

dates.each do |date|
  performance = 0

  # EOD balance for all investments
  user_1.holdings.each do |holding|
    if holding.purchased_date <= date
      holding.trade_histories.each do |history|
        investment_price = holding.investment.histories.find_by(date: date).price
        performance += history.shares_amount * investment_price
      end
    end

    # Only update the tokens when there is a purchase
    if holding.purchased_date == date
      holding.trade_histories.each do |history|
        investment_price = holding.investment.histories.find_by(date: date).price
        tokens -= history.shares_amount * investment_price
      end
    end
  end

  UserHistory.create(user: user_1, date: date, performance: performance, tokens: tokens)
end

# On 30 Nov, user bought the Haaland
user_history_2 = UserHistory.find_by(user: user_1, date: nov_30.date)
user_history_2.performance += holding_2.purchased_price * holding_2.shares_amount
user_history_2.save

# On 02 Dec, user bought the James
user_history_1 = UserHistory.find_by(user: user_1, date: dec_02.date)
user_history_1.performance += holding_1.purchased_price * holding_1.shares_amount
user_history_1.save
