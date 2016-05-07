class CommentsController < ApplicationController

  def create
    @parent = Article.find(params[:article_id]) if params[:article_id]   
    @parent = Comment.find(params[:comment_id]) if params[:comment_id]
    @comment = @parent.comments.new(comment_params)
    if @comment.save
      redirect_to article_path(@comment.article)
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.comments.blank?
      @comment.destroy
    end
    redirect_to :back
  end
 
  def new
    @parent = Article.find(params[:article_id]) if params[:article_id]   
    @parent = Comment.find(params[:comment_id]) if params[:comment_id]
    @comment = @parent.comments.build
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :commentable_id, :commentable_type)
    end

end
