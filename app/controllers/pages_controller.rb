class PagesController < ApplicationController
  def home
    @articles = Article.all.order(:created_at).reverse
  end

  def landing
    
  end
end
