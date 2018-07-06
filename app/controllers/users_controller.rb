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
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
end
