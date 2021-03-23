import consumer from "./consumer"

consumer.subscriptions.create("ActivityChannel", {
  connected() {
    console.log('connected activity');
    this.perform("appear")
    // Called when the subscription is ready for use on the server
  },
  
  disconnected() {
    // Called when the subscription has been terminated by the server
  },
  
  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // console.log(data);
    let elements = document.getElementById('kin');
    let num = parseInt(elements.innerHTML);
    // if (data.status == 'online') {
      num++
      elements.innerHTML = num
    // } else {
    //   num-1
    //   elements.innerHTML = num
    // }
    console.log("data", data);
    console.log("el", elements);
  }
});
