function chooseType(t) {
  if (t.target.checked) {
    $("#groupSelect").show();
    $("#friendSelect").hide();
  } else {
    $("#groupSelect").hide();
    $("#friendSelect").show();
  }
}
// function renderFriend(event) {
//   console.log(event.target.value);
// }
