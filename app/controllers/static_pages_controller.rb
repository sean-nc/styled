class StaticPagesController < ApplicationController
  before_action :logged_in?, only: :add_users

  def about
  end

  def contact
  end

  def add_users
    friends = current_user.following.search(params[:term])
    not_friends = User.search(params[:term])
    @users = (friends + not_friends).uniq
  end
end
