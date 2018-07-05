class StaticPagesController < ApplicationController
  before_action :logged_in?, only: [:add_users, :vote]

  def about
  end

  def contact
  end

  def add_users
    @users = User.search(params[:term]).paginate(:page => params[:page], :per_page => 10)
  end

  def vote
    @cards = Card.where.not(id: Vote.where(user_id: current_user.id).select(:card_id)).limit(1)
  end

  def explore
    @posts = Post.search(params[:term]).paginate(:page => params[:page], :per_page => 10)
  end
end
