class ArticlesController < ApplicationController
  before_action :authenticate!, except: [:index]
  before_action :find_article, only: [:show, :edit, :update, :delete]
  before_action :article_owner?, only:[:edit, :update, :delete]

  def index
    @articles = Article.all
  end


  def show
  end

  def  find_name
    @article = Article.find_by(name: params[:name])
  end


  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    
    if @article.save
      redirect_to dashboard_path, notice: "Successfully updated created a blog."
    else
      render :new
    end
  end

  
  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to dashboard_path, notice: "Successfully updated your blog."
    else
      render :edit
    end
  end

  def delete
    @article.destroy

    redirect_to dashboard_path
  end


  private

  def article_params
    params.require(:article).permit(:name, :body)
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def article_owner?
    unless current_user.try{id} == @article.user_id
      redirect_to root_path, notice: "Unauthorized action" and return 
    end
  end
end
