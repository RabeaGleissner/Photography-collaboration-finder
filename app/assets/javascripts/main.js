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
  console.log('changed');

    $.ajax({
      url: "edit",
      type: "GET",
      dataType: 'html',
      data: {selected_album_id: $('#user_album_attributes_flickr_id option:selected').val()},

        success: function(response){
        
         $('.flex_container#user_album_photos').html(response);
          console.log("success");
          console.log(response);
        },
        error: function(response){
          console.log("error");
          console.log(response);
        }
      });  
});




});