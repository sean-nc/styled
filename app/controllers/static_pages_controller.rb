class StaticPagesController < ApplicationController
  before_action :logged_in?, only: [:find_users, :vote, :explore]

  def about
  end

  def contact
    @message = Message.new
  end

  def find_users
    @users = User.search(params[:term]).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def vote
    @cards = Card.where.not(id: Vote.where(user_id: current_user.id).select(:card_id)).limit(3)
  end

  def explore
    @posts = Post.search(params[:term]).paginate(:page => params[:page], :per_page => 9)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
