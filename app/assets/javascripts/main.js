$(function(){

  $('.edit_user').submit(function(ev){
    ev.preventDefault();

    console.log('clicked');
    
    $('#wait_overlay').removeClass('hidden');

    this.submit();

});


});