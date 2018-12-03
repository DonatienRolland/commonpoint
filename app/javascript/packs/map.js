import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';


  const mapElement = document.getElementById('map');
  if (mapElement != null && mapElement.dataset.markers != null ) {
    var myLatLng = JSON.parse(mapElement.dataset.markers);
    var map = new google.maps.Map(mapElement, {
      zoom: 14,
      center: myLatLng
    });

    var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      title: 'Hello World!'
    });
  }



autocomplete();


