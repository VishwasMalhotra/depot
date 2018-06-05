$( document ).ready(function() {
  $('.store .entry > img').css( 'cursor', 'pointer' ).click(function() {
    $(this).parent().find(':submit').click();
  });
});
