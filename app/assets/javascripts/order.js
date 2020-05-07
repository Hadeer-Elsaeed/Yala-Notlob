function chooseType(t) {
  if (t.target.checked) {
    $("#groupSelect").show();
    $("#friendSelect").hide();
  } else {
    $("#groupSelect").hide();
    $("#friendSelect").show();
  }
}
function renderFriend(event) {
  let id=event.target.value
  $.ajax({
    type: "GET",
    url: "http://localhost:3000/user/"+id,
    success: function(result){
      var newDiv = $("<div/>")   // creates a div element
        .attr("id", result.id)  // adds the id
        .addClass("mycard2 ml-1 my-1")   // add a class
        .html(`<div><img src=${result.avatar}/> </div> <p>${result.name}</p>`);
      console.log(result)
      // var details=$('div').addClass("details");
      // var img = $('img').attr('src', result.avatar)
      // var name=$('p').text(result.name)
      // // details.append(img)
      // details.append(name)
      $("#myblock").append(newDiv)

    },
    error:function(error){
      // alert(error)
    }

  })
 
}
