function msgForm(){
  var shiftDown = false;
  var chatForm = $("#new_msg");
  var msgBox = chatForm.children("textarea");
  $(document).keypress(function (e) {
      if(e.keyCode == 13) {
          if(msgBox.is(":focus") && !shiftDown) {
           e.preventDefault(); // prevent another \n from being entered
      chatForm.submit();
      $(chatForm).trigger('reset');
          }
      }
  });
  $(document).keydown(function (e) {
      if(e.keyCode == 16) shiftDown = true;
  });
  $(document).keyup(function (e) {
      if(e.keyCode == 16) shiftDown = false;
  });
}