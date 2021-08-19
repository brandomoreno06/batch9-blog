class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end


  def show
    if (@article = Article.find_by(id: params[:id])).blank?
      render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
    end
  end

  def  find_name
    @article = Article.find_by(name: params[:name])
  end


  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  
  def edit
    @article = Article.find(params[:id])
  end


  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  
  def delete
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


  private

  def article_params
    params.require(:article).permit(:name, :body)
  end

end
