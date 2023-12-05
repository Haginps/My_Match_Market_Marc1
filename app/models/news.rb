class News < ApplicationRecord
  include HTTParty
  base_uri 'https://newsapi.org/v2/top-headlines'

  def fetch_football_news
    # Modify this based on the actual API you are using
    q = 'football'  # Adjust the category to fit your API's requirements
    response = RestClient.get("https://newsapi.org/v2/top-headlines?q=#{q}&apiKey=3a64b317910c4ccbb2f6697d61493ead")
    JSON.parse(response.body)['articles']
  end

end
