$(function () {
  $(".post-like").on("click", function () {
    var post_id = $(this).data("id");
    $.ajax({
      url: "/post/like/"+post_id,
      method: "GET",
      
    }).fail(function (a,b,c) {
      alert("error")
      console.log(a);
      console.log(b);
      console.log(c);
    });
  });
});


$(function() {
  console.log($.ajax);
});