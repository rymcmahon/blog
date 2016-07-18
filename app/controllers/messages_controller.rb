class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Thanks for emailing! I'll respond ASAP."
			redirect_to root_path(anchor: 'contact')
    else
      flash[:alert] = "You must provide a name, valid email address, and a message."
			redirect_to root_path(anchor: 'contact')
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :text)
  end

end
