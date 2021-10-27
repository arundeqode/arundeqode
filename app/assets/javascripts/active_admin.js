//= require active_admin/base
const set_active = function(selected = ""){
	product_id = $("#product_id").val();
  active = $("#active").is(':checked');
    $.ajax({
    type: "POST",
    url: `/admin/products/${product_id}/active?active=${active}`,
    success: function(result) {
      location.reload();
    },
    error: function(e){
      console.log(e);
    }
  });
};

$(function() {
  $("#active").change(function() {
  	set_active();
  });
});
