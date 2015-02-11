$(function() {

  $('#match').
    on('ajax:success',function(evt, data, status, xhr){
      console.log('success:', data);
    }).
    on('ajax:error',function(xhr, status, error){
      console.log('failed:', error);
    });

});