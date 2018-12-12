function autocomplete() {
  const btn = document.getElementById('check-map');
  document.addEventListener("DOMContentLoaded", function() {
    var pointAddress = document.getElementById('point_address');
    if (pointAddress) {
      var autocomplete = new google.maps.places.Autocomplete(pointAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(pointAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          btn.click();
          // e.click(); // Do not submit the form on Enter.
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };

