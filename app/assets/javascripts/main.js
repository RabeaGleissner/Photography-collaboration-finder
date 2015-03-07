$(function(){

  $('#wait_overlay').addClass('hidden');

  $('.matching_users .edit_user').submit(function(ev){
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
  $('#wait_overlay').removeClass('hidden');

    $.ajax({
      url: "edit",
      type: "GET",
      dataType: 'html',
      data: {selected_album_id: $('#user_album_attributes_flickr_id option:selected').val()},

        success: function(response){
        
         $('.flex_container#user_album_photos').html(response);
          console.log("success");
   
        },
        error: function(response){
          console.log("error");
          console.log(response);
        }
      });  
});

 $('a#hide_flash_notice').on('click', function(ev){
    ev.preventDefault();
        console.log('clicked')
       $(this).parent().addClass('hidden');
 });


});