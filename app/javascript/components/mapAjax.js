import GMaps from 'gmaps/gmaps.js';


function mapAjax(){
  const divMap = document.getElementById('google-map')
  const btn = document.getElementById('check-map')
  const input = document.getElementById('point_address')
  const mapElement = document.getElementById('map');
  if (btn != null) {
    btn.addEventListener('click', function() {
      var address = input.value;
      let sendValue = {
        point: divMap.dataset.point,
        value: address
      };
      saveWithAjax(divMap, sendValue)
      localizeOnTheMap(mapElement, address)
    });
  };
};

export { mapAjax }

function saveWithAjax(divMap, sendValue){
  $.ajax({
    url: divMap.dataset.url,
    type: "PUT",
    data: { params_value: sendValue },
  });
};

function localizeOnTheMap(mapElement, address){
  var geocoder, latitude, longitude, latlng, mapOptions, map, latlng, marker
  geocoder = new google.maps.Geocoder();
  geocoder.geocode( {
    'address': address},
    function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      latitude = results[0].geometry.location.lat();
      longitude = results[0].geometry.location.lng();
      latlng = new google.maps.LatLng(latitude, longitude);
      mapOptions = {
        zoom: 8,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
       }
      map = new google.maps.Map(mapElement, mapOptions);
      latlng = new google.maps.LatLng(latitude, longitude);
      map.setCenter(latlng);

      marker = new google.maps.Marker({
        map: map,
        position: latlng,
        title: 'Hello World!'
      });
    };
  });
};
