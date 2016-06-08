App.chat = App.cable.subscriptions.create "ChatChannel",
  received: (data) ->
    $('#messages').append(data.message)
    scrollMessages()

  speak: (msg) ->
    @perform 'speak', message: msg

$ ->
  $(document).on 'keypress', '#chat-speak', (event) ->
    if event.keyCode is 13
      App.chat.speak(event.target.value)
      event.target.value = ""
      event.preventDefault()

scrollMessages = ->
  # if we're at bottom
  setTimeout(() ->
    $("#messages").animate({ scrollTop: $("#messages")[0].scrollHeight }, 300);
  , 200)