# Create a file: app/services/news_service.rb
module NewsService
  def self.fetch_football_news
    [
      { title: 'FA Cup third-round draw: Arsenal vs Liverpool, Sunderland vs Newcastle and Wigan vs Man Utd', description: 'Plus: Wigan vs Man Utd, Man City vs Huddersfield, Chelsea vs Preston, Tottenham vs Burnley and Maidstone vs Stevenage or Port Vale; the FA Cup third-round matches will be played between January 5 and January 8' },
      { title: 'Football News 2', description: 'Description 2' },
      # Add more news articles as needed
    ]
  end
end

# app/services/news_service.rb
module NewsService
  def self.fetch_football_news
    [
      {
        title: 'FA Cup third-round draw: Arsenal vs Liverpool, Sunderland vs Newcastle and Wigan vs Man Utd',
        description: 'Plus: Wigan vs Man Utd, Man City vs Huddersfield, Chelsea vs Preston, Tottenham vs Burnley and Maidstone vs Stevenage or Port Vale; the FA Cup third-round matches will be played between January 5 and January 8',
        image_url: 'https://www.thisisanfield.com/wp-content/uploads/LFCARSPre.028.jpg'
      },
      {
        title: 'Erik ten Hag denies reports of disunity in Manchester United dressing room',
        description: 'Only ‘one or two’ players have questioned him, says manager. Under-fire Dutchman insists: "We are in the right direction"',
        image_url: 'https://i.guim.co.uk/img/media/ebad128834840c0beda9b794400ee05ef9934b57/0_25_1258_755/master/1258.jpg?width=620&dpr=2&s=none'
      },
      {
        title: 'FA Cup third-round draw: Arsenal vs Liverpool, Sunderland vs Newcastle and Wigan vs Man Utd',
        description: 'Plus: Wigan vs Man Utd, Man City vs Huddersfield, Chelsea vs Preston, Tottenham vs Burnley and Maidstone vs Stevenage or Port Vale; the FA Cup third-round matches will be played between January 5 and January 8',
        image_url: 'https://www.thisisanfield.com/wp-content/uploads/LFCARSPre.028.jpg'
      },
      {
        title: 'Erik ten Hag denies reports of disunity in Manchester United dressing room',
        description: 'Only ‘one or two’ players have questioned him, says manager. Under-fire Dutchman insists: "We are in the right direction"',
        image_url: 'https://i.guim.co.uk/img/media/ebad128834840c0beda9b794400ee05ef9934b57/0_25_1258_755/master/1258.jpg?width=620&dpr=2&s=none'
      },
      {
        title: 'FA Cup third-round draw: Arsenal vs Liverpool, Sunderland vs Newcastle and Wigan vs Man Utd',
        description: 'Plus: Wigan vs Man Utd, Man City vs Huddersfield, Chelsea vs Preston, Tottenham vs Burnley and Maidstone vs Stevenage or Port Vale; the FA Cup third-round matches will be played between January 5 and January 8',
        image_url: 'https://www.thisisanfield.com/wp-content/uploads/LFCARSPre.028.jpg'
      }
      # Add more news articles as needed
    ]
  end
end
