function createMsgChannel() {
  App.msgs = App.cable.subscriptions.create({
    channel: 'MsgsChannel', chat_id: parseInt($("#msg_chat_id").val())
  },
  {
    received: function(data) {
      $("#msgs").removeClass('hidden')
      $('#msgs').append(this.rendermsg(data));
      $("#msgs").animate({ scrollTop: $("#msgs").prop("scrollHeight")}, 1000);
      $("#chat-textarea").val("");
      return
    },
    rendermsg: function(data) {
      return "<p class='chat-msg'><span class='msg-username'>" + data.user + "</span>: " + data.msg + "<br/>" + "</p>";
    },
  });
return App.msgs;
}