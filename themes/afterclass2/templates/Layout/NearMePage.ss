<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false"></script>
<script type="text/javascript" src="{$ThemeDir}/js//jquery.min.js"></script>

<style>

.event_deets {
	margin: 5px 7px 0px 0px;
	padding: 10px;
	width: 30%; 
	float: left;
}

.event_deets h3 {
	font-size: 1.75em !important; /* event bubble header */
}

.event_deets ul {
	padding-left: 0;
	padding-bottom: 5px;
	border-bottom: solid black 1px;
}

.event_deets li { 
	color: black; 
	font-size: 1.33em;
	margin-right: 5px;
	list-style: none;
}

.event_deets p {
	font-size: 1.15em !important;
}

.event_pic {
	width: 59%; 
	float: left; 
	margin: 15px 0px 0px 5px;
	padding: 10px;
}

.event_pic > img {
	max-width: 100%; 
	height: auto; 
	padding: 2px;
	box-shadow: 2px 5px 15px 5px #222222;
}

.more_events_here {
	clear: both;
	margin: 0;
	padding-left: 10px;
}

.event-card {
	height: 100%;
		
}

.event-card-content {
	min-height: 1px;
}

.infobox-header {
	margin: 5px 0 5px 0;;
	padding: 1px 3px 1px 0 !important;
	
.infobox-list {
	list-style:none; 
	color: black; 
	padding-left: 0; 
	margin: 3px 1px;
}

@media only screen and (max-width: 500px) {
	.event_bubble {
		max-width: 320px;
		padding-right: 3px;
	}
	.event_deets {
		margin: 5px 7px 0px 0px;
		padding: 10px;
		width: 100%; 
		float: left;
	}
	
	.event_deets h3 {
		font-size: 1.75em !important; /* event bubble header */
	}
	.event_deets ul {
		padding-left: 0;
		padding-bottom: 5px;
		border-bottom: solid black 1px;
	}
	
	.event_deets li { 
		color: black; 
		font-size: 1.33em;
		margin-right: 5px;
		list-style: none;
	}
	
	.event_deets p {
		font-size: 1.15em !important;
	}
	
	.event_pic {
		display: none;
	}
	
	.event_pic > img {
		max-width: 100%; 
		height: auto; 
		padding: 2px;
		box-shadow: 2px 5px 15px 5px #222222;
	}
	
	.more_events_here {
		clear: both;
		margin: 0;
		padding-left: 10px;
	}
	
	.event-card {
		height: 100%;	
	}
	
}

.venue_section {
	margin: 5px 0px;
	padding: 3px 5px;
	background-color: rgba(112,128,144,0.10);
}

.venue_section:hover {
/*transition*/
	-webkit-transition:background-color: rgba(112,128,144,0.25);
	-moz-transition:background-color: rgba(112,128,144,0.25);
    -o-transition:background-color: rgba(112,128,144,0.25);
    transition:background-color: rgba(112,128,144,0.25);
    cursor: hand;

}

.canceled {
	color: #FF0000 !important;
}

</style>


<header id="secondary_header">
	<p style='list-style:none; display: inline-block; margin: 0 0 3px 0;'><span id='mapStart' style='font-size: 1em; vertical-align: middle;'></span>&nbsp;<span id='mapMark' style='font-size: 1em; vertical-align: middle; '></span></p>

</header>

<div id="single-page-content">
   
$Content
$Form

</div>


<div class='container-fluid' id='venuesWithEvents'>
<% loop Venues %>
	<% if Events %>
		<section class='row-fluid venue' id='$ID' data-link='$Link' <% if $Lat && $Lng %> data-lat='$Lat' data-lng='$Lng' <% else %> data-address='$Address' <% end_if %> data-title='$Title'>		
			<h2>$Title</h2>	
			<% loop Events.limit(6) %>
			<div data-title='$Title' data-link='$Link' data-image='$Image' data-cancel='$CancelReason' data-cost='$Cost' <% if Sponsors %><% loop Sponsors %> data-sponsor='$Sponsors' <% end_loop %><% end_if %> <% loop UpcomingDatesAndRanges() %> data-startdate='$StartDate.Day(), $StartDate.Month() $StartDate.DayOfMonth()' data-starttime='$StartTime.Nice' <% end_loop %> >
			<% include EventCard %>	
			</div>	
			<% end_loop %>
		</section>
	<% end_if %>
<% end_loop %>	
</div>
				
	
<script>
"use strict";
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
	var styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"});
    var mapcanvas = document.createElement('div');	
		mapcanvas.id = 'mapcanvas';
		mapcanvas.style.height = '600px';
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
			console.log("Browser DOES support Geolocation");
		    var browserSupportFlag = true;
		    navigator.geolocation.getCurrentPosition(function(position) {
		    	console.log("in getCurrentPosition");
		    	
				//initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
				initialLocation = new google.maps.LatLng(41.664468, -91.535157)
				var distanceFromInitialLocation = google.maps.geometry.spherical.computeDistanceBetween(initialLocation,iowaCity);	
				// If the current position is too far away from Iowa City, just default to centering around Iowa City	
				if(distanceFromInitialLocation < 32186.9){
					map.setCenter(initialLocation);
					var image = 'themes/afterclass2/images/position-indicator.png';
					var initalMarker = new google.maps.Marker({
						position: initialLocation,
						map: map,
						icon: image
					});  
					initalMarker.setMap(map);
					$('#mapStart').prepend("Your location is indicated on the map with this icon: ");
					$('#mapStart').append("<img src='themes/afterclass2/images/position-indicator.png' />");
					$('#mapMark').prepend("To see nearby, upcoming events, touch a marker: ");
					$('#mapMark').append("<img src='themes/afterclass2/images/marker.png' />");
				}else {
					$('#mapLoaded').text("You're too far away from Iowa City. Here are events in Iowa City");
				}
				console.log("finished getinitlocal");
				callback(initialLocation, pinAndDist);								  
		    }, function() {
		      handleNoGeolocation(browserSupportFlag);
		    });	     
		} else {
			// Browser doesn't support Geolocation
			console.log("Browser doesn't support Geolocation");
		    browserSupportFlag = false;
		    var initialLocation = handleNoGeolocation(browserSupportFlag);
		}
		
		console.log('getinitlocal last line');	
	}
	var venueCount = jQuery("#venuesWithEvents section").length;
	var countVenue = 0;
	
	function venueGen(initLocal, callback) {
		console.log("begin venueGen");
				
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
		
	function pinAndDist(initLocal, venueLatLng, venue, from) {
		//console.log('begin pinAndDist: ' + from);
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
		
		console.log(eventsHere);
		eventsHereString = eventsHere.join(' ');
		console.log(eventsHereString);
		eventBubbleString = "<div class='event_bubble'>" +
				"<div class='upcomingEvents'>" +
				eventsHereString +
				"</div>" +
				"</div>";
	
	    google.maps.event.addListener(marker, 'click', function () {
	  		infowindow.setContent(eventBubbleString);
	  		infowindow.open(map, this);	
		});
		
		if(countVenue == venueCount) {
			nearestVenues = [];
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
	
	var venueFromMe = {};
	
	function handleNoGeolocation(errorFlag) {   	
		initialLocation = iowaCity;
	    map.setCenter(initialLocation);
	    $('#status').text("Your location couldn't be detected. Showing events in Iowa City.");
	    console.log("in handleNoGeo: " + initialLocation);
	    return initialLocation;
	}  
		
	var infowindow = new google.maps.InfoWindow({
		content: "holding...",
		maxWidth: 380
		});
	
	var geocoder = new google.maps.Geocoder();
	
	getInitLocal(venueGen);

}

function error(msg) {
  var s = document.querySelector('#status');
  s.innerHTML = typeof msg == 'string' ? msg : "failed";
  s.className = 'fail';
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

</script>