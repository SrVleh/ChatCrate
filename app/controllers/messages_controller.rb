class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", {mod_message: message}
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message_param)
    render(partial: "message", locals: {message: message_param})
  end
end
