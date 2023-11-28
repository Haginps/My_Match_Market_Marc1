class NewsController < ApplicationController
  def index
<<<<<<< HEAD

  end

  def show

=======
    @news = News.all
  end

  def show
    @new = News.find(params[:id])
>>>>>>> f02696c898c84e36de70955ea2ab1d9444597549
  end
end
