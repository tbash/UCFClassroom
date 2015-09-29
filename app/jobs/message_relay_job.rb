class MessageRelayJob < ActiveJob::Base
  def perform(message)
    broadcast_params = {
      user_id: message.user_id,
      classroom_id: message.classroom_id,
      content: message.content
    }

    ActionCable.server.broadcast("classrooms:#{message.classroom_id}:messages", broadcast_params)
  end

  # This way will be available in Rails 5
  # def perform(message)
  #   ActionCable.server.broadcast "classrooms:#{message.classroom_id}:messages",
  #     message: MessagesController.render(partial: 'messages/message', locals: { message: message })
  # end
end
