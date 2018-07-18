class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)

    if @message.valid?
      ContactMailer.contact_email(@message).deliver_now
      redirect_to root_path
      flash[:success] = "Thank you for messaging us, we will contact you shortly."
    else
      flash[:danger] = "There was an error sending your message, please try again."
      redirect_to contact_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:email, :body)
  end
end
