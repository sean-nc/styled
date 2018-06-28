class VotesController < ApplicationController
  before_action :logged_in?

  def create
    @card = Card.find(params[:card_id])

    if params[:commit] == "Yes"
      current_user.upvote(@card)
    else
      current_user.downvote(@card)
    end

    respond_to do |format|
      format.html { redirect_to votes_path }
      format.js
    end
  end
end
