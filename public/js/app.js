$(function(){
  $(".mark-done").on( "click", function(){
    var id = $(this).data("id");
    $.post( "/orders/"+id+".json",
      { _method: "put", done: $(this).is(":checked") },
      function() {
        if ( $(this).is(":checked") )
        alert( "order has been completed");
      }, "json"
    );
  });
});
