class StaticPagesController < ApplicationController
  before_action :logged_in?, only: :add_users

  def about
  end

  def contact
  end

  def add_users
    @users = User.search(params[:term])
  end
end
