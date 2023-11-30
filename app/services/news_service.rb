class NewsService
  include HTTParty
  base_uri 'https://newsapi.org/v2'
  API_KEY = 'YOUR_NEWS_API_KEY' # Replace with your actual API key

  def self.latest_news
    response = get("/top-headlines", query: { country: 'us', apiKey: API_KEY })
    return [] unless response.success?

    response['articles']
  end
end
