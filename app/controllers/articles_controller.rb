class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article].permit(:title, :content))

    if @article.save
    redirect_to article_path(@article)
    flash[:success] = 'Article was successfully created'
    else 
      flash.now.alert = "Sorry your article is missing information"
      render :new
    end
  end

  private 

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
