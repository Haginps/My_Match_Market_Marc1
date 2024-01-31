require "open-uri"
require "date"

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

marc = User.new(email: "marchage1@gmail.com", first_name: "Jonas", last_name: "Hage", password: "123456789", tokens: 5000)
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
post_2 = Post.new(title: "Badiashile Stock Update: Resilient Recovery", description: "Badiashile, the defensive powerhouse, has rebounded from injury with remarkable resilience, signaling a potential bullish turnaround. After a period of absence, this player is back on the field, showcasing strength, determination, and an unwavering commitment to the game. Analysts are closely monitoring this stock, anticipating a positive trajectory as Badiashile regains full form and contributes to the team’s defensive solidity.", user: User.last)
post_2.channel = channel_1
post_2.photo.attach(io: file, filename: "benoit", content_type: "image/jpg")
post_2.save



james_investment = Investment.new(name: "Reece James", abbreviation: "REJS", rating: rand(0..10), category: "player", description: "The best RB in the premier league", image:"https://img.chelseafc.com/image/upload/f_auto,h_390,q_90/editorial/people/first-team/2023-24/Reece_James_profile_23-24_with_sponsor_headshot-removebg.png", team_logo_image: "https://static-00.iconduck.com/assets.00/chelsea-icon-2048x2048-f7v75m3m.png", country_flag_image: "https://cdn-icons-png.flaticon.com/512/197/197485.png")
james_investment.save

trent_investment = Investment.new(name: "Trent AA", abbreviation: "TRAA", rating: rand(0..10), category: "player", description: "The 2nd best RB in the premier league", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p169187.png", team_logo_image: "https://upload.wikimedia.org/wikipedia/hif/b/bd/Liverpool_FC.png", country_flag_image: "https://cdn-icons-png.flaticon.com/512/197/197485.png")
trent_investment.save

palmer_investment = Investment.new(name: "Cole Palmer", abbreviation: "CPLM", rating: rand(0..10), category: "player", description: "Breakthrough Chelsea player", image:"https://imagecache.365scores.com/image/upload/f_png,w_250,h_250,c_limit,q_auto:eco,d_Athletes:default.png,r_max,c_thumb,g_face,z_0.65/Athletes/78535", team_logo_image: "https://static-00.iconduck.com/assets.00/chelsea-icon-2048x2048-f7v75m3m.png", country_flag_image: "https://cdn-icons-png.flaticon.com/512/197/197485.png")
palmer_investment.save

messi_investment = Investment.new(name: "Lionel Messi", abbreviation: "LOME", rating: rand(0..10), category: "player", description: "The goat", image:"https://images.mlssoccer.com/image/private/t_editorial_squared_6_desktop/f_png/mls-mia-prd/urj5ghqpk8k151t5oj9g.png", team_logo_image: "https://upload.wikimedia.org/wikipedia/en/thumb/5/5c/Inter_Miami_CF_logo.svg/800px-Inter_Miami_CF_logo.svg.png", country_flag_image: "https://cdn.countryflags.com/thumbs/argentina/flag-round-250.png")
messi_investment.save

gordon_investment = Investment.new(name: "Anthony Gordon", abbreviation: "ANGR", rating: rand(0..10), category: "player", description: "The everton boy who went to Newcastle", image:"https://www.nufc.co.uk/media/79576/anthony-gordon.png?anchor=center&mode=crop&width=350&height=460&quality=75", team_logo_image: "https://assets.stickpng.com/images/580b57fcd9996e24bc43c4ec.png", country_flag_image: "https://cdn-icons-png.flaticon.com/512/197/197485.png")
gordon_investment.save

bowen_investment = Investment.new(name: "Jarrod Bowen", abbreviation: "JRBW", rating: rand(0..10), category: "player", description: "England forward with rapid pace", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p178186.png", team_logo_image: "https://upload.wikimedia.org/wikipedia/sco/thumb/c/c2/West_Ham_United_FC_logo.svg/1200px-West_Ham_United_FC_logo.svg.png", country_flag_image: "https://cdn-icons-png.flaticon.com/512/197/197485.png")
bowen_investment.save

cunha_investment = Investment.new(name: "Matheus Cunha", abbreviation: "MTCH", rating: rand(0..10), category: "player", description: "Brazialin who plays at wolves", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p430871.png", team_logo_image: "https://upload.wikimedia.org/wikipedia/sco/thumb/f/fc/Wolverhampton_Wanderers.svg/1200px-Wolverhampton_Wanderers.svg.png", country_flag_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Brazilian_flag_icon_round.svg/1200px-Brazilian_flag_icon_round.svg.png")
cunha_investment.save

olise_investment = Investment.new(name: "Michael Olise", abbreviation: "MHOL", rating: rand(0..10), category: "player", description: "French talent", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p443661.png", team_logo_image: "https://upload.wikimedia.org/wikipedia/hif/c/c1/Crystal_Palace_FC_logo.png", country_flag_image: "https://cdn-icons-png.flaticon.com/512/197/197485.png")
olise_investment.save

willian_investment = Investment.new(name: "Willian", abbreviation: "WILL", rating: rand(0..10), category: "player", description: "Ex chelsea giant", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p47431.png", team_logo_image: "https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Fulham_FC_%28shield%29.svg/1200px-Fulham_FC_%28shield%29.svg.png", country_flag_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Brazilian_flag_icon_round.svg/1200px-Brazilian_flag_icon_round.svg.png")
willian_investment.save

elanga_investment = Investment.new(name: "Anthony Elanga", abbreviation: "ANEL", rating: rand(0..10), category: "player", description: "Manchest united talent on loan", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p449434.png", team_logo_image: "https://cdn.freebiesupply.com/logos/large/2x/nottingham-forest-fc-logo-png-transparent.png", country_flag_image: "https://static.vecteezy.com/system/resources/previews/022/109/528/original/sweden-flag-round-shape-free-png.png")
elanga_investment.save

nunez_investment = Investment.new(name: "Darwin Nunez", abbreviation: "DRNZ", rating: rand(0..10), category: "player", description: "Uruguay stricker for liverpool", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p447203.png", team_logo_image: "https://upload.wikimedia.org/wikipedia/hif/b/bd/Liverpool_FC.png", country_flag_image: "https://flagdownload.com/wp-content/uploads/Flag_of_Uruguay_Flat_Round-1024x1024.png")
nunez_investment.save

haaland_investment = Investment.new(name: "Erling Haaland", abbreviation: "ERHL", rating: rand(0..10), category: "player", description: "The norweigian beast", image:"https://resources.premierleague.com/premierleague/photos/players/110x140/p223094.png", team_logo_image: "https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Manchester_City_FC_badge.svg/1200px-Manchester_City_FC_badge.svg.png", country_flag_image: "https://flagdownload.com/wp-content/uploads/Flag_of_Norway_Flat_Round.png")
haaland_investment.save

number_of_days = 30
start_date = Date.today - number_of_days

# Example investments
investments = [
  james_investment, trent_investment, palmer_investment, messi_investment,
  haaland_investment, gordon_investment, olise_investment, elanga_investment,
  bowen_investment, cunha_investment, willian_investment, nunez_investment
]

# Initialize starting prices and momentum for each investment
starting_prices = {
  james_investment => 20,
  trent_investment => 30,
  palmer_investment => 7,
  messi_investment => 110,
  haaland_investment => 70,
  gordon_investment => 11,
  olise_investment => 13,
  elanga_investment => 7,
  bowen_investment => 10,
  cunha_investment => 9,
  willian_investment => 15,
  nunez_investment => 18
}

momentum = {
  james_investment => 0.5,
  trent_investment => -0.3,
  palmer_investment => 0.2,
  messi_investment => 2.3,
  haaland_investment => 0.6,
  gordon_investment => -0.2,
  olise_investment => 0.1,
  elanga_investment => 0.3,
  bowen_investment => -0.1,
  cunha_investment => 0.2,
  willian_investment => -0.4,
  nunez_investment => 0.5
}

# Loop through each day and create historical data
(start_date..Date.today).each do |date|
  investments.each do |investment|
    # Get the last price or use the starting price
    last_price = History.where(investment: investment).last&.price || starting_prices[investment]

    # Ensure momentum for the investment is present, otherwise use a default value
    investment_momentum = momentum[investment] || 0

    # Calculate new price based on momentum and random fluctuation
    fluctuation = rand(-1.0..1.0) # Random fluctuation
    new_price = last_price + investment_momentum + fluctuation
    new_price = [new_price, 0].max # Ensure price doesn't go below 0

    # Create history record for this investment on this date
    History.create(date: date, price: new_price, investment: investment)

    # Occasionally change the momentum
    if rand < 0.1 # 10% chance to change momentum
      momentum[investment] = rand(-0.5..0.5)
    end
  end
end

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

puts "Seeding completed"
