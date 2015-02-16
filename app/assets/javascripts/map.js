var myMap = myMap || {};

var latitude;
var longitude;


myMap.initialize = function() {

    var mapOptions = {
        center: { lat: latitude, lng: longitude},     
        zoom: 8,
    };

    var map = new google.maps.Map(myMap.mapCanvas, mapOptions);

    var markerOptions = {
      position: { lat: latitude, lng: longitude }
    };

    var marker = new google.maps.Marker(markerOptions);
    marker.setMap(map);

};

$(document).ready(function() {

  latitude = parseFloat($('#latitude').text());
  longitude = parseFloat($('#longitude').text());

  console.log(latitude);
  console.log(longitude);

  myMap.mapCanvas = $('#map-canvas')[0];
  myMap.initialize();


 });



