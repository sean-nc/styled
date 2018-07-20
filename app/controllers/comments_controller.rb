class CommentsController < ApplicationController
  before_action :logged_in?

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment was successfully created."
      redirect_to [@post.user, @post]
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if current_user == @post.user || current_user == @comment.user
      @comment.destroy
      flash[:notice] = "Comment was successfully destroyed."
      redirect_to [@post.user, @post]
    else
      flash[:danger] = "You don't have access to delete that."
      redirect_to [@post.user, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
