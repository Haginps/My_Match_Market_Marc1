class NewsController < ApplicationController
  def index
    @news = NewsService.fetch_football_news

  end

  def show
    @article = NewsService.fetch_football_news[params[:id].to_i]
  end
end
