function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var pointAddress = document.getElementById('point_address');
    console.log(pointAddress)
    if (pointAddress) {
      var autocomplete = new google.maps.places.Autocomplete(pointAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(pointAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.click(); // Do not submit the form on Enter.
          // e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };

