/* Global Variables */
var markerArray = [];
var infowindow = new google.maps.InfoWindow({
	content: "holding...",
	maxWidth: 340
	});	
var iowaCity = new google.maps.LatLng(41.661736, -91.540017);
//var venueCount = $("#venuesWithEvents section").length;
//var countVenue = 0;
var venueFromUser = {};
var userInitPosition;

/* Helper Functions */

//obsolete?
function error(msg) {
  var s = document.querySelector('#status');
  s.innerHTML = typeof msg == 'string' ? msg : "failed";
  s.className = 'fail';
}

//obsolete?
function makeMarker(options){
   var pushPin = new google.maps.Marker({map:map});
   pushPin.setOptions(options);
   google.maps.event.addListener(pushPin, 'click', function(){
     infoWindow.setOptions(options);
     infoWindow.open(map, pushPin);
   });
   markerArray.push(pushPin);
   return pushPin;
}

function handleNoGeolocation(errorFlag) {   	
	var userInitPosition = iowaCity;
    $('#status').text("Your location couldn't be detected. Showing events in Iowa City.");
    return userInitPosition;
}  

/* End Helper Functions */

function sortVenues() {
	// empty list to sort venues by distance
	var nearestVenues = [];
	// you can only do for-in loops on objects (as opposed to arrays) in js. who knew?
	for (var venueID in venueFromUser) {
		nearestVenues.push([venueID, venueFromUser[venueID]])
	}	
	nearestVenues.sort(function(a,b) {return a[1] - b[1]});
	$("#venuesWithEvents .clear").remove();
	for (var v=0; v < nearestVenues.length; v++) {
		//console.log('sorting...');
		var vid = nearestVenues[v];
		$("#venuesWithEvents").append( $("#" + vid) );
		$("#venuesWithEvents").append( $("<div class='clear'></div>") );
	}
}

function addEventInfo( marker, venue ) {		
	var venueName = $('#' + venue.id).data("title");
	var venueLink = $('#' + venue.id).data("link");  
	var eventsHere = [];
	var eventsHereString = '';
	var eventBubbleString = '';
	var eventLimit = 5;
	
	eventsHere.push("<a class='button tag' href='" + venueLink + "'>" + venueName + "</a>");
	
	$(venue).children('div').each(function(index, Element) {
		var eventTitle = $(this).data('title');
		var eventImage = $(this).data('image');
		var eventLink = $(this).data('link');
		var eventCost = $(this).data('cost');
		var startDate = $(this).data('startdate');
		var startTime = $(this).data('starttime');	
		var eventStringSeg = 
		"<div> <h3> <a href='" + eventLink + "'>" + eventTitle + "</a> </h3> <ul class='infobox-list'>" + 
			"<li>" + startDate + ", " + startTime + ((eventCost  !== "") ? ", Cost: " + eventCost : "") + "</li>" 
			+ "</ul></div>";
				
		eventsHere.push(eventStringSeg);

		// sets maximum number of events per bubble to eventLimit
		if (index >= eventLimit) {
			return false;
		}
	});
	
	/* string concatination for infoBubble */
	eventsHereString = eventsHere.join(' ');
	eventBubbleString = 
		"<div class='event_bubble'>" +
		eventsHereString +
		"</div>";

	/* make infoBubbles clickable */
    google.maps.event.addListener(marker, 'click', function () {
  		infowindow.setContent(eventBubbleString);
  		infowindow.open(map, this);	
  		//infowindow.maxWidth(200);
	});
}

function venueGen() {	
	//DON'T CHANGE IDs or Class Names in NearMePage.ss
	//Scans venues loaded on page for data-attributes and pulls data

	//note: geocoder used to be global variable
	var geocoder = new google.maps.Geocoder();

	$('.venue').each(function(index, element) {
		var venue = this;
		var venueID = venue.id;
		var title = $(this).data("title");
		var lat = $(this).data("lat");
		var lng = $(this).data("lng");
		var address = $(this).data("address");
		var venueLatLng;
		
		if(lat && lng) {
			//console.log('venue has coords');
			venueLatLng = new google.maps.LatLng(lat, lng);
		} else if (address != null) {
			//console.log('venue does not have coords, has address');
			geocoder.geocode( {'address': address}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
				//Geocoder returns array of information, first indice is lat/lng
				venueLatLng = results[0].geometry.location;
				}				
			});
		} else {
			//console.log("No coords or address available for " + title)
		}	

		// drops pin
		var marker = new google.maps.Marker({
			position: venueLatLng,
			map: map
		});	

		//console.log("I have " + title + " at " + venueLatLng);
		// fills 'infowindow' for each pin with list of events
		addEventInfo( marker, venue );  

		venueFromUser[venueID] = google.maps.geometry.spherical.computeDistanceBetween(userInitPosition, venueLatLng);

	});	

	/* when finished, sort venues divs on page. */
	sortVenues();

}

function getInitLocal() {
	//finds users location
	if(navigator.geolocation) {
		//console.log("Browser DOES support Geolocation");
	    var browserSupportFlag = true;
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	//console.log('geolocated');
			userInitPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
			var userDistanceFromIowaCity = google.maps.geometry.spherical.computeDistanceBetween(userInitPosition,iowaCity);	
			// If the current position is too far away from Iowa City, just default to centering around Iowa City	
			if (userDistanceFromIowaCity < 32186.9) {
				map.setCenter(userInitPosition);
				var image = 'themes/afterclass2/images/position-indicator.png';
				var initalMarker = new google.maps.Marker({
					position: userInitPosition,
					map: map,
					icon: image
				});  
				//initalMarker.setMap(map);
			} else {
				$('#mapLoaded').text("You're too far away from Iowa City. Here are events in Iowa City");
			}
			venueGen();							  
	    }, function(error) {
	    	//console.log('navigator failed');
	    	var errorFlag = false;
	    	userInitPosition = handleNoGeolocation(errorFlag)
	    	map.setCenter(userInitPosition);
	    	venueGen();
	    }, { 
	    	enableHighAccuracy: true, 
	    	timeout: 1000,
	    	maximumAge: 0
	    });	     
	} else {
		//console.log("Browser does NOT support Geolocation");
	    var browserSupportFlag = false;
	    userInitPosition = handleNoGeolocation(browserSupportFlag);
	    venueGen();
	}	
}

function genMapCanvas() {
	// generates map styles, objects, DOM objects

    var mapcanvas = document.createElement('div');	
	 mapcanvas.id = 'mapcanvas';
	 mapcanvas.class = 'map-canvas';
	 mapcanvas.style.width = '100%';	
	$('.NearMePage .map-container').append(mapcanvas);

	//afterclassMap styles located in MapStyles.js
	var afterclassMap = new google.maps.StyledMapType(styles, {name: "AfterClass Style Map"});
	var MapOptions = {
	    zoom: 16,
	    center: iowaCity,
	    panControl: false,
	    mapTypeControl: false,
	    navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
	    disableDefaultUI: false,
	    mapTypeId: google.maps.MapTypeId.ROADMAP,
	    streetViewControl: false,
	    zoomControlOptions: {
    		position: google.maps.ControlPosition.LEFT_BOTTOM
  		}
	};
	map = new google.maps.Map(document.getElementById("mapcanvas"), MapOptions);
	 map.mapTypes.set('map_style', afterclassMap);
	 map.setMapTypeId('map_style');
	
	//getInitLocal();
}

$(window).load(function() {
	if( $('.NearMePage .map-container').length ){
		genMapCanvas( getInitLocal() );
	}
});
