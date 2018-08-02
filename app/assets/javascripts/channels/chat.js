//= require cable
//= require_self
//= require_tree .

this.App = {};
App.cable = ActionCable.createConsumer("/cable");

$(document).on('turbolinks:load', function() {
  $("#msgs").animate({ scrollTop: $("#msgs").prop("scrollHeight")}, 1000);
});