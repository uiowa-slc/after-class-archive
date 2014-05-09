"use strict";
var mq = window.matchMedia( "(min-width: 480px)" );	
var markerArray = [];
var infoWindow = null;

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

function locate() {
	// map generation
	// Create an array of styles.
	var styles = [ 
	{
	    "stylers": [
	      { "weight": 2.7 },
	      { "saturation": -71 },
	      { "invert_lightness": true },
	      { "visibility": "on" },
	      { "hue": "#8800ff" }
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
	var infowindow = new google.maps.InfoWindow({
		content: "holding...",
		maxWidth: 340
		});	
	var geocoder = new google.maps.Geocoder();	
	var styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"});
    var mapcanvas = document.createElement('div');	
		mapcanvas.id = 'mapcanvas';
		mapcanvas.class = 'map-canvas';
		if (mq.matches) {
			mapcanvas.style.height = '600px';
		} else {
			mapcanvas.style.height = '300px';
		}
		mapcanvas.style.width = '100%';	
	jQuery('#single-page-content').append(mapcanvas);
	var iowaCity = new google.maps.LatLng(41.661736, -91.540017);
	var nearMeMapOptions = {
	    zoom: 17,
	    center: iowaCity,
	    panControl: false,
	    mapTypeControl: false,
	    //navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
	    disableDefaultUI: true,
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementById("mapcanvas"), nearMeMapOptions);
		map.mapTypes.set('map_style', styledMap);
		map.setMapTypeId('map_style');
			
	// Try W3C Geolocation (Preferred)
	
	var initialLocation;
	
	function getInitLocal(callback) {
		if(navigator.geolocation) {
			//console.log("Browser DOES support Geolocation");
		    var browserSupportFlag = true;
		    navigator.geolocation.getCurrentPosition(function(position) {
				initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
				//initialLocation = new google.maps.LatLng(41.664468, -91.535157)
				var distanceFromInitialLocation = google.maps.geometry.spherical.computeDistanceBetween(initialLocation,iowaCity);	
				// If the current position is too far away from Iowa City, just default to centering around Iowa City	
				if (distanceFromInitialLocation < 32186.9) {
					map.setCenter(initialLocation);
					var image = 'themes/afterclass2/images/position-indicator.png';
					var initalMarker = new google.maps.Marker({
						position: initialLocation,
						map: map,
						icon: image
					});  
					initalMarker.setMap(map);
					//$('#mapStart').prepend("Your location is indicated on the map with this icon: ");
					//$('#mapStart').append("<img src='themes/afterclass2/images/position-indicator.png' />");
					//$('#mapMark').prepend("To see nearby, upcoming events, touch a marker: ");
					//$('#mapMark').append("<img src='themes/afterclass2/images/marker.png' />");
				}else {
					$('#mapLoaded').text("You're too far away from Iowa City. Here are events in Iowa City");
				}
				callback(initialLocation, pinAndDist);								  
		    }, function() {
		      handleNoGeolocation(browserSupportFlag);
		    });	     
		} else {
			// Browser does not support Geolocation
			//console.log("Browser doesn't support Geolocation");
		    browserSupportFlag = false;
		    var initialLocation = handleNoGeolocation(browserSupportFlag);
		}
		
	}
	var venueCount = jQuery("#venuesWithEvents section").length;
	var countVenue = 0;
	
	function venueGen(initLocal, callback) {
				
		jQuery('.venue').each(function(index, element) {
			var title = jQuery(this).data("title");
			var lat = jQuery(this).data("lat");
			var lng = jQuery(this).data("lng");
			var address = jQuery(this).data("address");
			var venueLatLng;
			var venueDistance;
			var venue = this;
			
			if(lat && lng) {
				countVenue = ++countVenue;
				venueLatLng = new google.maps.LatLng(lat, lng);
				callback(initLocal, venueLatLng, venue, 'had lat');
			} else {
				geocoder.geocode( { 'address': address}, function(results, status) {
					countVenue = ++countVenue;
					if (status == google.maps.GeocoderStatus.OK) {
						venueLatLng = results[0].geometry.location;
						callback(initLocal, venueLatLng, venue  , 'no lat');
					}				
				});
			}			
		});	
	}
	
	var venueFromMe = {};
		
	function pinAndDist(initLocal, venueLatLng, venue, from) {
		var venueDistance = google.maps.geometry.spherical.computeDistanceBetween(initLocal, venueLatLng);	
		var venueID = venue.id;
		var venueName = jQuery('#' + venueID).data("title");
		var venueLink = jQuery('#' + venueID).data("link");
			venueFromMe[venueID] = venueDistance;		
		var marker = new google.maps.Marker({
				position: venueLatLng,
				map: map
			});				    
		var eventsHere = [];
		var eventsHereString = '';
		var eventBubbleString = '';
		
		eventsHere.push("<h2 class='infobox-header'><a href='" + venueLink + "'>" + venueName + "</a></h2>");
		
		jQuery(venue).children('div').each(function(index, Element) {
			var eventTitle = jQuery(this).data('title');
			var eventImage = jQuery(this).data('image');
			var eventCancel = jQuery(this).data('cancel');
			var eventLink = jQuery(this).data('link');
			var eventCost = jQuery(this).data('cost');
			var startDate = jQuery(this).data('startdate');
			var startTime = jQuery(this).data('starttime');	

			var eventStringSeg = "<div> <h3> <a href='" + eventLink + "'>" + eventTitle + "</a> </h3> <ul class='infobox-list'>" + "<li> Date: " + startDate + "</li>" + "<li> Time: " + startTime + "</li>" + "<li> Cost: " + eventCost + "</li>" + "</ul></div>";
					
			eventsHere.push(eventStringSeg);
		});
		
		eventsHereString = eventsHere.join(' ');
		eventBubbleString = 
			"<div class='event_bubble'>" +
			eventsHereString +
			"</div>";
	
	    google.maps.event.addListener(marker, 'click', function () {
	  		infowindow.setContent(eventBubbleString);
	  		infowindow.open(map, this);	
	  		//infowindow.maxWidth(200);
		});
		
		if(countVenue == venueCount) {
			var nearestVenues = [];
			for (var venueID in venueFromMe) {
				nearestVenues.push([venueID, venueFromMe[venueID]])
			}	
			nearestVenues.sort(function(a,b) {return a[1] - b[1]})
			for (var v=0; v < nearestVenues.length; v++) {
				//console.log('sorting...');
				var vid = nearestVenues[v];
				jQuery("#venuesWithEvents").append( jQuery("#" + vid) );
			}
		}		
	}
		
	function handleNoGeolocation(errorFlag) {   	
		initialLocation = iowaCity;
	    map.setCenter(initialLocation);
	    $('#status').text("Your location couldn't be detected. Showing events in Iowa City.");
	    return initialLocation;
	}  
			
	getInitLocal(venueGen);

}

function error(msg) {
  var s = document.querySelector('#status');
  s.innerHTML = typeof msg == 'string' ? msg : "failed";
  s.className = 'fail';
}

// media query change
function WidthChange(mq) {
	if (mq.matches) {
		console.log('trying to change to 600!');
		mapcanvas.style.height = '600px';
	}
	else {
		console.log('trying to change to 300!');
		mapcanvas.style.height = '300px';
	}
}





/*
$(document).ready(function() {
  if (navigator.geolocation) {
	  navigator.geolocation.getCurrentPosition(success, error);
	} else {
	  error('not supported');
	}
});
*/

$(document).ready(function() {
  locate();
});