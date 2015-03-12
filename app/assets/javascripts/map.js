var myMap = myMap || {};

var latitude;
var longitude;


myMap.initialize = function() {

    var mapOptions = {
        center: { lat: latitude, lng: longitude},     
        zoom: 6,
        styles:[{"featureType":"all","elementType":"all","stylers":[{"hue":"#ff0000"}]}]
    };



    var map = new google.maps.Map(myMap.mapCanvas, mapOptions);

    var markerOptions = {
      position: { lat: latitude, lng: longitude },
      icon: 'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png'
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



