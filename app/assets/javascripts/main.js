$(function(){

  $('#wait_overlay').addClass('hidden');

  $('.edit_user').submit(function(ev){
    ev.preventDefault();
   
    $('#wait_overlay').removeClass('hidden');
    this.submit();

  });

   $('#more_photos').
   on('ajax:success',function(evt, data, status, xhr){
    $('.flex_container#photos').append(data);
    var new_page = parseInt($('#page_param').val())+1;
    $('#page_param').val(new_page);
  }).
   on('ajax:error',function(xhr, status, error){
    console.log('failed:', error);
  });



 $('#user_album_attributes_flickr_id').change(function(){
  console.log('success');

  // $ajax({
  //   url: "remote_action_in_your_controller",
  //   type: "GET",
  //   data: {select_tag_value: $('#select_tag_id option:selected').text()},
  // })
});



   //  $('#album_photos').
   //  on('ajax:success',function(evt, data, status, xhr){
   //   console.log('success:', data);

   // }).
   //  on('ajax:error',function(xhr, status, error){
   //   console.log('failed:', error);
   // });


});