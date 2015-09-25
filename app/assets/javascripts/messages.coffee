source = new EventSource('/messages/events')
source.addEventListener 'message', (e) ->
  alert e.data
