import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("The Sender is = " + data.sender);
    console.log("The Type is = " + data.meal);
    var date = new Date();
    var myDate = date.toLocaleTimeString([], {timeStyle: 'short'});
    $(".caret").text(parseInt($(".caret").text()) + 1);
    let myNoti = '<li>'+
      '<a href="#" class="top-text-block">'+
        '<div class="top-text-heading"><b>'+ data.sender +'</b> invited You to Have a '+ data.meal +'</div>'+
        '<div class="top-text-light">Today ' + myDate + '</div>'+
      '</a>'+
    '</li>';
    $("#NotificationList").append(myNoti);
  }
});