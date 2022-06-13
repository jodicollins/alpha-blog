class ArticlesController < ApplicationController
  # used to display a single Article item
  def show
    @article = Article.find(params[:id])
  end

  # used to display a summarized listing of al items in the Article table
  def index
      @articles = Article.all
  end

end