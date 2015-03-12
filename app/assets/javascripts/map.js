var myMap = myMap || {};

var latitude;
var longitude;


myMap.initialize = function() {

    var mapOptions = {
        center: { lat: latitude, lng: longitude},     
        zoom: 6,
        styles:[{"featureType":"water","stylers":[{"saturation":43},{"lightness":-11},{"hue":"#0088ff"}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"hue":"#ff0000"},{"saturation":-100},{"lightness":99}]},{"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#808080"},{"lightness":54}]},{"featureType":"landscape.man_made","elementType":"geometry.fill","stylers":[{"color":"#ece2d9"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#ccdca1"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#767676"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"}]},{"featureType":"poi","stylers":[{"visibility":"off"}]},{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"color":"#b8cb93"}]},{"featureType":"poi.park","stylers":[{"visibility":"on"}]},{"featureType":"poi.sports_complex","stylers":[{"visibility":"on"}]},{"featureType":"poi.medical","stylers":[{"visibility":"on"}]},{"featureType":"poi.business","stylers":[{"visibility":"simplified"}]}]
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



