#= require cable
#= require_self
#= require_tree .

@App = {}
App.cable = Cable.createConsumer 'ws://127.0.0.1:28080'


# This may be used for production
# hostname = (url) ->
#   parser = document.createElement('a')
#   parser.href = url
#   parser.href = parser.href
#   parser.protocol = parser.protocol.replace("http", "ws")
#   parser.href
#
# @App = {}
# App.cable = Cable.createConsumer hostname("/")
