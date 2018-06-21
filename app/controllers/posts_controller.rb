class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
  before_action :correct_user?, only: :destroy

  def show
    @user = User.find(@post.user_id)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to [current_user, @post]
      flash[:notice] = "Post was successfully created."
    else
      render 'new'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post was successfully destroyed."
    redirect_to current_user
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_user?
    @user = User.find(@post.user_id)
    unless @user == current_user
      flash[:alert] = "You're not allowed to do that"
      redirect_to @user
    end
  end

  def post_params
    params.require(:post).permit(:image, :gender)
  end
end
