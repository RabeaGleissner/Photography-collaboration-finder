var myMap = myMap || {};

var latitude;
var longitude;

$(document).ready(function() {

  latitude = parseFloat($('#latitude').text());

  longitude = parseFloat($('#longitude').text());

  console.log(latitude);
  console.log(longitude);
 });


myMap.initialize = function() {

    var mapOptions = {
        center: { lat: latitude, lng: longitude},     
        zoom: 14,
        mapTypeId:google.maps.MapTypeId.ROADMAP //default
    };

    var map = new google.maps.Map(myMap.mapCanvas, mapOptions);

}

$(function(){
  $
  myMap.mapCanvas = $('#map-canvas')[0];
  myMap.initialize();
});

