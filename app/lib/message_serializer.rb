class MessageSerializer
  include ActionView::Helpers::SanitizeHelper
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def as_json
    {
      content: sanitize(message.content),
    }
  end
end
