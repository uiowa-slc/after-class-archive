function loadEventGmaps() {
	console.log('load script');
      var script = document.createElement('script');
      script.type = 'text/javascript';
      script.src = 'http://maps.googleapis.com/maps/api/js?v=3.exp&libraries=geometry&sensor=false&callback=initializeEventMap&key=AIzaSyB6ZQYL6TQGH7SLLvJRM9pQwOk5G6glKLE';
      document.body.appendChild(script);
}

function GetLocation(address) {
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({ 'address': address }, function (results, status) {
	  if (status == google.maps.GeocoderStatus.OK) {
	    //ParseLocation(results[0].geometry.location);
	    return results[0].geometry.location;
	  } else {
	    alert('error: ' + status);
	  }
	});
}
  
function initializeEventMap() {
  
    // Create a new StyledMapType object, passing it the array of styles,
    // as well as the name to be displayed on the map type control.
	var styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"});

	// Create a map object, and include the MapTypeId to add
	// to the map type control.
	jQuery('#mini-map').each(function(index, element) {
		var name = jQuery(this).data("title");
		var lat = jQuery(this).data("lat");
		var lng = jQuery(this).data("lng");
		var address = jQuery(this).data("address");
		var venueLatLng;
		var venue = this;
		
		var mapOptions = {
		    zoom: 15,
		    //disableDefaultUI: true,
		    scrollwheel: true,
		    draggable: false,
		    //panControl: true,
		    navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
		    center: new google.maps.LatLng(lat, lng),
		    streetViewControl: true,
		    mapTypeControlOptions: {
		      mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
		    }
		};

		if (lat && lng) {
			var place = new google.maps.LatLng(lat, lng);
			var myOptions = {zoom: 16, center: place,mapTypeId: google.maps.MapTypeId.ROADMAP };
	   		var map = new google.maps.Map(document.getElementById("mini-map"),mapOptions);
	   		var geomarker = new google.maps.Marker({ map: map, position: place });
		    map.mapTypes.set('map_style', styledMap);
		    map.setMapTypeId('map_style');
		} else {
	    	var geocoder = new google.maps.Geocoder();
	  		geocoder.geocode({ 'address': address }, function (results, status) {
		        if (status == google.maps.GeocoderStatus.OK) {
			        place = results[0].geometry.location;
			        var myOptions = {zoom: 16, center: place,mapTypeId: google.maps.MapTypeId.ROADMAP };
			        var map = new google.maps.Map(document.getElementById("mini-map"),mapOptions);
			        var geomarker = new google.maps.Marker({ map: map, position: place });  
					map.mapTypes.set('map_style', styledMap);
					map.setMapTypeId('map_style');
		      	}
		    });
	    }
	});
}
if( $('.LocalistEvent .map-container').length ){
	window.onload = loadEventGmaps();
}
