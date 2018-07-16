class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]
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
      card = @post.cards.create(user_id: current_user.id)
      current_user.upvote(card)
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
  end

  def update
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

  def post_params
    params.require(:post).permit(:image, :gender, :description)
  end
end
