$(function() {
  $('#message-form').submit(function(event) {
    event.preventDefault();
    let $messageContent = $(this).find("textarea[name='message[content]']")
    Remote.messaging.sendMessage($messageContent.val());
    $messageContent.val(null);
  });

  $(Remote.messaging).on('received', function(event, data) {
    let { content: content, created_at: createdAt } = data.message;
    let { uid } = data.user;
    let html = `<li class='messages-list-item'>
                  <div class='messages-list-item-name'>
                    ${ uid }
                  </div>
                  <div class='messages-list-item-content'>
                    ${ content }
                  </div>
                </li>`;

    $('#messages-list').append($(html));
  });
});
