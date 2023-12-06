# Create a file: app/services/news_service.rb
# app/services/news_service.rb
module NewsService
  def self.fetch_football_news
    [
      {
        title: 'Mauricio Pochettino Makes Reece James Feelings Clear as Chelsea Captaincy Questioned',
        description: 'Reece James is set to miss Chelsea Premier League clash against Brighton this weekend after receiving a red card in the defeat against Newcastle',
        image_url: 'https://talksport.com/wp-content/uploads/sites/5/2023/08/reece-james-chelsea-premier-league-839524426.jpg',
        content: "Mauricio Pochettino has defended Reece James after the Chelsea captain came under criticism following his red card in the defeat against Newcastle last weekend. The Argentine made it clear that James is still building towards full fitness and blamed fatigue for his decision to haul down Anthony Gordon - resulting in his second yellow card against the Magpies.
        The 24-year-old apologised for being sent off against Newcastle with a message on Instagram. I take full responsibility for my red card today, two silly mistakes. Another lesson for me to learn, the Chelsea captain wrote in a post on Instagram.
        I would like to apologise to the fans and my teammates. The performance today was far below our standards but this game does not define us!
        We have made huge improvements this season against many top teams. We will be back next weekend.
        Speaking ahead of the clash against Brighton this weekend, Pochettino said: Yes, of course. It is part of the process also. Too many times he was injured but now step by step, he is building.
        I think he was a little bit tired in the moment when he got the second yellow card. And of course, he realises he is still far away from his best condition, to complete 90 minutes - he is working really hard."
      },
      {
        title: 'Haaland Unleashes Frustration: Explosive Reaction to Refs Decision',
        description: 'Erling Haalands explosive reaction to a controversial referee decision adds an unexpected layer of intensity to the match, showcasing the passionate side of the prolific striker.',
        image_url: 'https://www.telegraph.co.uk/content/dam/football/2023/12/04/TELEMMGLPICT000358788889_17016930351340_trans_NvBQzQNjv4BqGrtKBSVBdSas7RVbBpUspdDa77SxtaeMxMTbXLRy0dU.jpeg?imwidth=680',
        content: "Manchester City have been charged by the Football Association following the furious confrontation with the referee, Simon Hooper, that blighted the end of an otherwise thrilling 3-3 draw with Tottenham on Sunday.

        The Premier League champions have been charged with failing to control their players after a set-to followed Hooper’s decision not to allow City a possibly important advantage in the final minutes of play. Erling Haaland, who led the complaints and was seen screaming at Hooper at close range, will not be subject to personal charges for his behaviour, nor for a tweet sent immediately after the match.

        Hooper’s controversial call came in the fifth minute of second‑half stoppage time. Haaland was fouled by Yves Bissouma but got up to play the ball over the top of the Spurs defence to set Jack Grealish clear for a run on goal, with Hooper seemingly signalling he had given City licence to take the advantage, only for the referee then to blow his whistle and call play back for the foul.

        Haaland immediately confronted the referee and was joined by a number of other City players. At the end of the match the Norwegian stormed off the field and sent a message to his six million X followers with a clip of the incident and the caption: “Wtf”."
      },
      {
        title: 'Olises Brilliance: A Spectacular Goal that Defines Precision',
        description: 'In a mesmerizing display of skill and finesse, football player Olise leaves spectators in awe with a stunning goal, a masterpiece of precision and technique that etches his name in the highlight reels of the beautiful game.',
        image_url: 'https://cloudfront-us-east-2.images.arcpublishing.com/reuters/JWVM5ZUD2VL7RCQHEI3TCUMFZA.jpg',
      },
      {
        title: 'Liverpool manager Jurgen Klopp now claims Chelsea legend is ‘one of the greatest players’ in PL history',
        description: 'Jurgen Klopp, the esteemed manager of Liverpool, pays tribute to the illustrious career of ex-Chelsea player Willian, hailing him as a Premier League great. Klopps recognition acknowledges the Brazilians significant impact and contributions to English football, highlighting Willians lasting influence on the league.',
        image_url: 'https://www.thisisanfield.com/wp-content/uploads/2023-05-03-050-Liverpool_Fulham.jpg',
      },
      {
        title: 'FA Cup third-round draw: Arsenal vs Liverpool, Sunderland vs Newcastle and Wigan vs Man Utd',
        description: 'Plus: Wigan vs Man Utd, Man City vs Huddersfield, Chelsea vs Preston, Tottenham vs Burnley and Maidstone vs Stevenage or Port Vale; the FA Cup third-round matches will be played between January 5 and January 8',
        image_url: 'https://www.thisisanfield.com/wp-content/uploads/LFCARSPre.028.jpg',
      }
      # Add more news articles as needed
    ]
  end
end
