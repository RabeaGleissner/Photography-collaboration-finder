var myMap = myMap || {};

myMap.initialize = function(){
  var mapOptions = {
    center: { lat: 51.52, lng: -0.115 },
    zoom: 5,

  };

  myMap.map = new google.maps.Map(myMap.mapElement, mapOptions);

}