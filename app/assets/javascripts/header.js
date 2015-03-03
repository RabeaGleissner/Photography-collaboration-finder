$(function(){

  $('nav ul li#menu').on("click", function(){
 
    $(this).children("ul").toggle();
  });

  $('nav a.nav-icon').on("click", function(){
  
  console.log('clicked');

    $('ul#mobile').slideToggle();
  });



});