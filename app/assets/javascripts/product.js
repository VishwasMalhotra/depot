function AjaxCall(elements) {
  this.data_rating = elements.data_rating
};

AjaxCall.prototype.init = function() {
  var _this = this
  this.data_rating.change(function(){
    _this.productRating($(this));
  });
};

AjaxCall.prototype.productRating = function(_this) {
  rating_url = _this.data('url');
  product_id = _this.data('product-id');
  selected_rating = _this.val();

  $.ajax({
    method: "POST",
    url: rating_url,
    data : { product_id: product_id, value: selected_rating },
    dataType : 'JSON',

    success: function(result){
      alert(result.message);
    },
    error: function(result){
      alert(result.errors);
    }
  });
};


$( document ).ready(function() {
  var elements = {
    data_rating : $( '[data-rating]' ),
  },
    ajaxCall = new AjaxCall(elements);
    ajaxCall.init();
});
