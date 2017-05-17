$(document).ready(function(){

  $('#add_to_cart').on('click',function(){
    var product_id = Number($('#product_id').val());
    var hash = {};

    if (Cookies.getJSON('cart')){
      hash = Cookies.getJSON('cart');
      if (hash.hasOwnProperty(product_id)) {
        hash[product_id] ++;
      } else {
        hash[product_id] = 1;
      }
    } else {
      hash[product_id] = 1;
    }

    Cookies.set('cart', hash);
    $('#cart_size').text(Object.keys(Cookies.getJSON('cart')).length);
    alert(I18n.t('javascript.added_to_cart'));
  })

  $('.delete_order').on('click',function(){

    var product_id = Number($(this).data('myval'));
    var hash = {};
    if (Cookies.getJSON('cart')){
      hash = Cookies.getJSON('cart');
      if (hash.hasOwnProperty(product_id)) {
        delete hash[product_id]
      }
    }

    Cookies.set('cart', hash);
    $('#cart_size').text(Object.keys(Cookies.getJSON('cart')).length);
    var parent = document.getElementById('carts_list');
    var node = document.getElementById('product_cart_' + product_id);
    parent.removeChild(node);
    $('#carts_size').text(Object.keys(Cookies.getJSON('cart')).length);
    $('#total_cost').text(recaculate_cost (hash));
    alert(I18n.t('javascript.remove_cart'));
  })

  $('.quantity_pro_cart input').on('change', function(e){

      var quantity = $(this).val();
      if (quantity > 0) {
        var product_id = Number($(this).data('product_id'));
        var hash = {};

        if (Cookies.getJSON('cart')){
          hash = Cookies.getJSON('cart');
          if (hash.hasOwnProperty(product_id)) {
            hash[product_id] = quantity;
          }
        }
        Cookies.set('cart', hash);
        $('#total_cost').text(recaculate_cost (hash));
      } else if (quantity == 0){
        $(this).val('1');
        $(this).keyup();
      } else {
        alert(I18n.t('javascript.input_number'));
      }
  })

  $('#pay').on('click',function(){
    $.ajax({
      url: '/orders',
      type: 'post',
      dateType: 'json',
      success: function(result){
        if (result.quantity == 0) {
          alert(I18n.t('javascript.this_product') + result.product_name +
            I18n.t('javascript.out_stock'));
        } else if (result.quantity > 0) {
          alert(I18n.t('javascript.sorry_only_have') + result.quantity +
            I18n.t('javascript.product_for_item') + result.product_name +
            I18n.t('javascript.please_update_cart'));
        }else if (result.not_login) {
          $('#login').click();
        } else if (result.alert){
          alert(result.alert);
        } else if (result.order_id){
          document.location.href = "/orders/" + result.order_id;
        } else {
          document.location.href="/";
        }
      },
      error: function(result){
        alert(result.reason);
        location.reload();
      }
    });
  })

  hide_all_order_detail();
  show_first_order_detail();
  $('.list-group-item').on('click', function(e){
    hide_all_order_detail();
    $('#order_detail_'+$(this).data('itemid')).show();
  })

});

function recaculate_cost(hash){
  var total_product_cost = 0;
  $.each( hash, function( product_id, quantity ) {
    var element = $('#product_cart_' + product_id);
    total_product_cost += quantity * element.data('price');
  });
  return total_product_cost;
}

function hide_all_order_detail(){
  for (var i = 0; i < $('#ordersize').data('ordersize'); i++) {
    $('#order_detail_'+i).hide();
  }
}

function show_first_order_detail(){
  $('#order_detail_0').show();
}
