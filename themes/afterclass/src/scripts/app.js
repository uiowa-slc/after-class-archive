
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
  
function initialize() {
	  // all map styles
	var styles = [	 
		{
		    "stylers": [
		      { "weight": 2.7 },
		      { "saturation": -21 },
		      { "invert_lightness": true },
		      { "visibility": "on" },
		      { "hue": "#FFCD00" }
		    ]
		  },{
		    "elementType": "geometry",
		    "stylers": [
		      { "weight": 1.6 },
		      { "lightness": -20 },
		      { "saturation": -13 },
		      { "gamma": 1.33 }
		    ]
		  },{
		    "featureType": "road",
		    "elementType": "geometry.fill",
		    "stylers": [
		      { "color": "#000000" },
		      { "weight": 3.6 },
		      { "hue": "#a200ff" },
		      { "lightness": 38 },
		      { "saturation": -4 }
		    ]
		  },{
		    "featureType": "water",
		    "stylers": [
		      { "hue": "#00b2ff" },
		      { "lightness": -2 },
		      { "saturation": 27 }
		    ]
		  }
	];
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
		    scrollwheel: false,
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

window.onload = initialize();
try {
    Typekit.load({
      loading: function() {
        // JavaScript to execute when fonts start loading
      },
      active: function() {
        $('.masonry-grid').isotope({ 
            "layoutMode": "masonry", 
            "itemSelector": ".masonry-grid-item",
            "getSortData": { "name": ".name", "category": "[data-category]" }, 
            "masonry": { 
                "gutter" : 20 
            } 
         });        
       },
      inactive: function() {
        // JavaScript to execute when fonts become inactive
      }
    })
  } catch(e) {}

  
$(document).ready(function() {

});
