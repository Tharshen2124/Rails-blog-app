class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all 
  end

  def show 
    id = params[:id]
    @article = Article.find(id)
  end

  #creates a new article but doesnt save it 
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
      
    if @article.update(article_params)
      #flash[:success] = "Object was successfully updated"
      redirect_to @article
    else
      #flash[:error] = "Something went wrong"
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy 
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  #filters the params
  private
    def article_params 
      params.require( :article ).permit(:title, :body, :status)
    end
end
