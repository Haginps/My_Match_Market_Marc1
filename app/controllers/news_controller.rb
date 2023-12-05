class NewsController < ApplicationController
  def index
    @news = NewsService.fetch_football_news
  end
end
