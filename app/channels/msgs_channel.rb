class MsgsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "msgs_#{params[:chat_id]}"
  end
end