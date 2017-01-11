$(document).on('turbolinks:load', function() {
  App.init();
});

$(document).ready(function() {
  $(".notify").slideDown(300, function() {
    window.setTimeout(function() {
      $(".notify").slideUp(300, function() {
        $(".notify").hide();
      });
    }, 6000);
  });
  $(".close-message").click(function(){
    $(".notify").slideUp(300, function() {
      $(".notify").hide();
    });
  });
});
