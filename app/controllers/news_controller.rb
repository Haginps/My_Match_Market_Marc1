class NewsController < ApplicationController
  def index
    @news = News.all
  end

  def show
    @new = News.find(params[:id])
  end
end
