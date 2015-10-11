class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages"
  end

  def send_message(data)
    message = current_user.messages.create(content: data['content'])
    ActionCable.server.broadcast 'messages', { message: message,
                                               user: current_user }
  end
end
