
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false"></script>
<script type="text/javascript" src="{$ThemeDir}/js//jquery.min.js"></script>


<header id="secondary_header">
	<h1>Events Nearby</h1>
</header>
<div id="single-page-content">
      <p id="status">Finding your location....</p>

$Content
$Form

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

	 var styledMap = new google.maps.StyledMapType(styles,
    {name: "Styled Map"});
  /*var s = document.querySelector('#status');
  s.innerHTML = "IMU!";
  s.className = 'success';*/
  var mapWidth = "100%";
  
  var mapcanvas = document.createElement('div');
  mapcanvas.id = 'mapcanvas';
  mapcanvas.style.height = '300px';
  mapcanvas.style.width = mapWidth;
  document.querySelector('#single-page-content').appendChild(mapcanvas);
  var iowacity = new google.maps.LatLng(41.661736, -91.540017)
  //var myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  var myLatlng = iowacity;
  var myOptions = {
    zoom: 15,
    center: myLatlng,
    panControl: true,
    mapTypeControl: false,
    navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);
   map.mapTypes.set('map_style', styledMap);
  map.setMapTypeId('map_style');
// Try W3C Geolocation (Preferred)
  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
		initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
		 iowacity = new google.maps.LatLng(41.661736, -91.540017)

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
  }
  // Browser doesn't support Geolocation
  else {
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
  <% loop Venues %>
    <% if Events %>

  //geo-coding to convert our addresses to usable longitude/latitude  
  var geocoder;
  geocoder = new google.maps.Geocoder();
  var address = "$Address";
  
  <% if Lat %>
    var venueLatLng = new google.maps.LatLng($Lat, $Lng);
    var marker = new google.maps.Marker({
      map: map,
      position: venueLatLng
    });
    google.maps.event.addListener(marker, 'click', function () {
	infowindow.setContent("<% loop Events(2) %><div style='font-size:13px;padding:2px 0px;'><a href='$Link'><% loop Event %>$Title<% end_loop %> - $StartDate.format(M). $StartDate.format(j)</a></div><% end_loop %><strong><a href='$Link'>$Title</a></strong>");
	infowindow.open(map, this);
	});
  <% else %>
    geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
        //map.setCenter(results[0].geometry.location);

		//var testLatLng = new google.maps.LatLng(41.661736, -91.540017);
		var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
        });
		google.maps.event.addListener(marker, 'click', function () {
		infowindow.setContent("<% loop Events(2) %><div style='font-size:13px;padding:2px 0px;'><a href='$Link'><% loop Event %>$Title<% end_loop %> - $StartDate.format(M). $StartDate.format(j)</a></div><% end_loop %><strong><a href='$Link'>$Title</a></strong>");
		infowindow.open(map, this);
		});
		
      } else {
        //alert("Geocode was not successful for the following reason: " + status);
      }
    });
  <% end_if %>
  <% end_if %>
  <% end_loop %>
}

function error(msg) {
  /*var s = document.querySelector('#status');
  s.innerHTML = typeof msg == 'string' ? msg : "failed";
  s.className = 'fail';*/
  
  // console.log(arguments);
}

/*$(document).ready(function() {
  if (navigator.geolocation) {
	  navigator.geolocation.getCurrentPosition(success, error);
	} else {
	  error('not supported');
	}
});*/
$(document).ready(function() {
  locate();
});
</script>