class NewsController < ApplicationController
  def index
    @news = NewsService.latest_news
  end

  def show
    @new = News.find(params[:id])
  end
end
