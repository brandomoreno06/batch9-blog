class PagesController < ApplicationController
  before_action :authenticate!, only: [:dashboard]

  def home
    @articles = Article.all.order(:created_at).reverse
  end

  def dashboard
    @articles = user_logged_in? && current_user.articles.order(:created_at).reverse
  end

  def landing
    
  end
end
