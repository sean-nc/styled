class LikesController < ApplicationController
  before_action :logged_in?
  before_action :set_post

  def create
    current_user.like(@post)
    respond_to do |format|
      format.html { redirect_to [@post.user, @post] }
      format.js
    end
  end

  def destroy
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
    respond_to do |format|
      format.html { redirect_to [@post.user, @post] }
      format.js
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
