class ArticlesController < ApplicationController
  # used to display a single Article item
  def show
    @article = Article.find(params[:id])
  end

  # used to display a summarized listing of al items in the Article table
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain: params[:article]
    #render plain: @article.inspect
    
    #save to database
    if @article.save
      # alert is used when something goes wrong
      flash[:notice] = "Article was created successfully."
      #redirect to show page
      #redirect_to article_path(@article)
      #shortcut for redirect 
      redirect_to @article
    else
      render 'new'
    end
  end
end