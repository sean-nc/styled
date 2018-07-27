function createMsgChannel() {
  App.msgs = App.cable.subscriptions.create({
        channel: 'MsgsChannel', chat_id: parseInt($("#msg_chat_id").val())
        },
        {
        received: function(data) {
          $("#msgs").removeClass('hidden')
          return $('#msgs').append(this.rendermsg(data));
        },
        rendermsg: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.msg + "</p>";
  },
      });
return App.msgs;
}