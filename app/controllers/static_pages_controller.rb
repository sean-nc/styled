class StaticPagesController < ApplicationController
  before_action :logged_in?, only: [:add_users, :vote]

  def about
  end

  def contact
  end

  def add_users
    friends = current_user.following.search(params[:term])
    not_friends = User.search(params[:term])
    @users = (friends + not_friends).uniq
  end

  def vote
    @cards = Card.joins(:votes).where.not(user_id: current_user.id).limit(5)
  end
end
