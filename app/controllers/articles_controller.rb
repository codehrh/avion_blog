class ArticlesController < ApplicationController
  before_action :set_article_id, only: %i[show edit update destroy]

  def index
    @articles = Article.all
    @articles_count = Article.count
  end

  def show
    @article = Article.find(params[:id])
    @articles_comments = @article.comments
  end

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
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

  def set_article_id
    @article = Article.find(params[:id])
  end
end
