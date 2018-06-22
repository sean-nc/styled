class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
  before_action :correct_user?, only: :destroy
  before_action :logged_in?


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

  def edit
    @post = Post.find_by(user_id: params[:user_id],
                         id: params[:id])
  end

  def update
    @post = Post.find_by(user_id: params[:user_id],
                         id: params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to [current_user, @post]
    else
      render 'edit'
    end
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
    params.require(:post).permit(:image, :gender, :description)
  end
end
