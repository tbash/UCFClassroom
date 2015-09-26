source = new EventSource('/messages/events')
source.addEventListener 'message', (e) ->
  message = $parseJSON(e.data).message
  $('#channel').append($('<li>').text("#{message.user}: #{message.content}"))
