class UsersController < ApplicationController
  before_action :logged_in?

  def show
    @user = User.friendly.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page], :per_page => 9)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def following
    @title = "Following"
    @user  = User.find_by_slug(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find_by_slug(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  def liked_photos
    @user = User.friendly.find(params[:id])
    likes = @user.liked_posts
    votes = Vote.where(user_id: @user.id).where(stylish: "Yes").select(:card_id)
    cards = Post.where(id: Card.where(id: votes).select(:post_id))
    posts = likes + cards
    @posts = posts.uniq.sort_by(&:created_at).reverse!.paginate(:page => params[:page], :per_page => 9)
  end
end
