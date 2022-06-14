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

  # find the article and display the form
  def edit
    #debugger
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain: params[:article]
    #render plain: @article.inspect
    
    #save to database
    if @article.save
      # alert is used when something goes wrong
      flash[:notice] = "Article was created successfully."
      #redirect to 'show' page
      #redirect_to article_path(@article)
      #shortcut for redirect 
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity
    end
  end


  # work behind the scenes to impact the Artice table to update the info
  def update
    #debugger
    # white list parameters to make title and description available to use
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      # redirect to the articles 'show' path
      redirect_to @article
    else
      #render the validation form again. Validation errors we need to correct
      render 'edit', status: 422
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path #to articles listing page
  end

end