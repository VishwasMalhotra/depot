$( document ).ready(function() {
  $( '[data-rating]' ).change(function(){
    rating_url = $(this).data('url');
    product_id = $(this).data('product-id');
    selected_rating = $(this).val();

    $.ajax({
      method: "POST",
      url: rating_url,
      data : { product_id: product_id, rating: selected_rating },
      dataType : 'json',

      success: function(result){
        alert("Thanks for the rating.");
    }});
  });
});
