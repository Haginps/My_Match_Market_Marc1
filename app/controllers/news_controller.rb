class NewsController < ApplicationController
  def index
    @today_tokens = current_user.user_histories.find_by(date: Date.today).tokens.round(2)

    @news = NewsService.fetch_football_news

    # raise
  end

  def show
    @today_tokens = current_user.user_histories.find_by(date: Date.today).tokens.round(2)

    @article = NewsService.fetch_football_news[params[:id].to_i]
  end
end
