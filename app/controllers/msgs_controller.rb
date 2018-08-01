class MsgsController < ApplicationController
  def create
    msg = Msg.new(msg_params)
    msg.user = current_user
    if msg.save
      ActionCable.server.broadcast( "msgs_#{msg_params[:chat_id]}",
        msg: msg.content,
        user: msg.user.username
      )
    else
      redirect_to chats_path
    end
  end
private
    def msg_params
      params.require(:msg).permit(:content, :chat_id)
    end
end
