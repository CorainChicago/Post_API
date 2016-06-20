$(document).on("click", "#refill", function(){
 $.ajax({
      type: "GET",
      contentType: "application/json; charset=utf-8",
      url: 'posts/fill_database',
      async: true,
      success: function(result) {
        console.log(result);
        location.reload(true);
      },
      error: function (result) {
        console.log("Ajax request failed");
      }
    });
})
  



