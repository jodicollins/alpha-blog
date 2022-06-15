class ArticlesController < ApplicationController
  # helper Before_action filter
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # used to display a single Article item
  def show
  end

  # used to display a summarized listing of al items in the Article table
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  # find the article and display the form
  def edit
    #debugger
  end

  def create
    @article = Article.new(article_params)
    #render plain: params[:article]
    #render plain: @article.inspect
    
    #save to database
    if @article.save
      # alert is used when something goes wrong
      flash[:notice] = "Article was created successfully."
      # redirects to 'show' page
      #redirect_to article_path(@article)
      # shortcut for redirect 
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # work behind the scenes to impact the Artice table to update the info
  def update
    #debugger
    # white list parameters to make title and description available to use
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article # redirect to the articles 'show' path
    else
      #render the validation form again. Validation errors we need to correct
      render 'edit', status: 422
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path #to articles listing page
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end