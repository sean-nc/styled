class StaticPagesController < ApplicationController
  before_action :logged_in?, only: [:home, :find_users, :vote, :explore]

  def home
    @following_id = current_user.following.map(&:id)
    @posts = Post.where(user_id: @following_id).paginate(:page => params[:page], :per_page => 9)
    respond_to do |format|
      format.html
      format.js
    end
  end

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
    @colours = ["White", "Black", "Grey", "Yellow", "Red", "Blue", "Green", "Brown", "Pink", "Orange", "Purple"]
    @posts = Post.search(params[:term], params[:gender], params[:colours], params[:style])
                 .where.not(user_id: current_user.id).paginate(:page => params[:page], :per_page => 9)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def hot
    @time = 24.hours.ago
    @cards = Card.joins(:votes).where(votes: Vote.popular_from(@time))

    #### optimize later
    # @cards = Card.left_joins(:votes)
    #              .select("cards.*, COUNT(votes.id) as vote_count")
    #              .group("votes.card_id")
    #              .order("vote_count")
    #              .distinct("cards.id")

    if @cards.any?
      @cards = @cards.sort_by { |card| -card.votes.popular_from(@time).count }
                                     .paginate(:page => params[:page], :per_page => 10)
    else
      @cards = Card.all
    end
  end
end
