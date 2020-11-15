class ArticlesController < ApplicationController
  before_action :authenticate_user!

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
    #@article.user = current_user
    if @article.save
    redirect_to article_path(@article)
    flash[:success] = 'Article was successfully created'
    else 
      redirect_to root_path
      flash.now.alert = "Sorry your article is missing information"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated'
    else 
      redirect_to edit_article_path, notice: 'Something went wrong, try again'
    end
  end

  private 

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
