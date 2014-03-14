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
	<h1>Events Nearby</h1>
</header>
<div id="single-page-content">
      <p id="status">Finding your location....</p>

$Content
$Form

</div>

<div id="venue_list">
	<%-- holder for venues --%>
</div>

<script>
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
	
	var iowacity = new google.maps.LatLng(41.661736, -91.540017);
	var nearMeMapOptions = {
	    zoom: 17,
	    center: iowacity,
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
	if(navigator.geolocation) {
	    browserSupportFlag = true;
	    navigator.geolocation.getCurrentPosition(function(position) {
			initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
			iowacity = new google.maps.LatLng(41.661736, -91.540017);
	
			var distanceFromInitialLocation = google.maps.geometry.spherical.computeDistanceBetween(initialLocation,iowacity);	
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
				$('#status').text("Your location is indicated on the map with this icon:");
				$('#status').append("<img src='themes/afterclass2/images/position-indicator.png' />");
			}else {
				$('#status').text("You're too far away from Iowa City. Here are events in Iowa City");
			}	      
	    }, function() {
	      handleNoGeolocation(browserSupportFlag);
	    });
	} else {
		// Browser doesn't support Geolocation
	    browserSupportFlag = false;
	    handleNoGeolocation(browserSupportFlag);
	}
  
    function handleNoGeolocation(errorFlag) {   	
		initialLocation = iowacity;
	    map.setCenter(initialLocation);
	    $('#status').text("Your location couldn't be detected. Showing events in Iowa City.");
	}  
	
	var infowindow = new google.maps.InfoWindow({
	content: "holding..."
		});
	
    var geocoder;	
	geocoder = new google.maps.Geocoder();
	var address = "$Address";
	
	<% loop Venues %>
	<% if AfterClassEvents %>	
	
	//jQuery('#venue_list').prepend("<div id='$ID' class='venue_section'><h2 style='text-decoration: underline;'>$Title</h2></div>");
	
	<% loop AfterClassEvents %>
	
	/*
	jQuery("#{$Up.ID}").append("<h3> $Title </h3>");
	jQuery("#{$Up.ID}").append("<p> $nearMeSummary <a href='$link'>...more...</a></p>");
	jQuery("#{$Up.ID}").append("Cost: $Cost");
	*/
		
	<% if $Up.Lat %>
    var venueLatLng = new google.maps.LatLng($Up.Lat, $Up.Lng);
    var marker = new google.maps.Marker({
      map: map,
      position: venueLatLng
    });
   	<% else %>
	//geo-coding to convert our addresses to usable longitude/latitude  
    geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
    var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
        });
    } else {
        //alert("Geocode was not successful for the following reason: " + status);
      }
    });
    <% end_if %>
	google.maps.event.addListener(marker, 'click', function () {
	infowindow.setContent("<div class='event_bubble'>" +
				"<div class='event_deets'>" +
				"<h3><a href=$Link>$Title</a></h3>" +
				"<ul>" +
				"<% if $CancelReason %><li class='canceled'>Canceled: $CancelReason </li><% end_if %>" +
				"<% if $Cost %><li> Cost: $Cost </li><% end_if %>" +
				"<li><% loop UpcomingDatesAndRanges.limit(1) %><% if $StartDate %>On: $StartDate.NiceUs <% end_if %><% if $StartTime %> @ $StartTime <% end_if %><% end_loop %></li>" +
				"</ul>" +					
				"<p> $nearMeSummary <a href='$Link'>...Read More...</a>" +
				"</div>"+
				"<div class='event_pic'>" +
				"<img src='http://afterclass.uiowa.edu/assets/Uploads/_resampled/CroppedImage730462-547622501983886527472867626312n.jpg' />" +
				"</div>" +
				"</div>" +
				"<div class='more_events_here'>" +
				//"<p id='$Up.ID'> More Events Upcoming Here:  </p>" +
				"</div>");
	infowindow.open(map, this);
	});
	//set First to fill in content on string, others only fill in more events section. 
	<% end_loop %>
	<% end_if %>
	<% end_loop %>
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

