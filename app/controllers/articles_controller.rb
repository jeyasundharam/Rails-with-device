class ArticlesController < ApplicationController
  
	
  http_basic_authenticate_with name: "sundhar", password: "jeya", except: [:index, :show]
	
  def index
    @articles = Article.all
  end
 
  def show
    @article = Article.find(params[:id])
  end
 
  def new
    @article = Article.new
  end
 
  def edit
    @article = Article.find(params[:id])
  end
 
  def create
    @article = Article.new(article_params)
 
    if @article.save
      redirect_to @article
      flash[:notice]="Your Article saved"
	else
      render 'new'
      flash[:notice]="Your Article Not saved"
    end
  end
 
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
		
      flash[:notice]="Your Article updated"
      redirect_to @article
    else
      flash[:notice]="Your Article Not updated"
      render 'edit'
    end
  end
 
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
	 flash[:notice]="Your Article deleted"
         redirect_to articles_path
	else
	 flash[:notice]="Your Article not deleted"
	end
		
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
