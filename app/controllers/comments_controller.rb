class CommentsController < ApplicationController
  before_action :find_article
  before_action :find_comment, only: [:destroy]
  before_action :comment_owner?, only: [:destroy]
  before_action :authenticate!

  def create
    @comment = @article.comments.new(comment_params)
    @comment.commenter = current_user.id
    if @comment.save
      redirect_to articles_path, notice: "Successfull posted a comment."
    else
      redirect_to articles_path, alert: "Failed to post a comment."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to articles_path, notice: "Your comment has been deleted"
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_owner?
    redirect_to articles_path, alert: "Not allowed to delete others' comment." and return unless @comment.commenter.to_i == current_user.id.to_i
  end
end
