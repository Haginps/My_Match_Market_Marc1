class NewsController < ApplicationController
  def index
    @news = NewsService.fetch_football_news

    # raise
  end

  def show
    @article = NewsService.fetch_football_news[params[:id].to_i]
  end
end
