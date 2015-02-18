$(function(){

  $('#wait_overlay').addClass('hidden');

  $('.edit_user').submit(function(ev){
    ev.preventDefault();

    console.log('clicked');
    
    $('#wait_overlay').removeClass('hidden');

    this.submit();

  });

  $('#more_photos').
  on('ajax:success',function(evt, data, status, xhr){
   $('.flex_container').append(data);
  var new_page = parseInt($('#page_param').val())+1;
  $('#page_param').val(new_page);
  
 }).
  on('ajax:error',function(xhr, status, error){
   console.log('failed:', error);
 });

  $('#click').click(function(ev){
    console.log('clicked');
    ev.preventDefault();
    $('#account').toggle();
  });


});